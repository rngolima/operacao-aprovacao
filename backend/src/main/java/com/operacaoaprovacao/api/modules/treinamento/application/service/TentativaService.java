package com.operacaoaprovacao.api.modules.treinamento.application.service;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.auth.domain.repository.UsuarioRepository;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.*;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.*;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.TentativaSimuladoRepository;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.SimuladoRepository;
import com.operacaoaprovacao.api.modules.treinamento.domain.service.MotorCorrecaoCebraspe;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

/**
 * Servico de Aplicacao que orquestra o ciclo de vida das tentativas de simulado dos alunos,
 * desde o inicio do cronometro, salvamento continuo com telemetria ate a submissao final com correcao Cebraspe.
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TentativaService {

    private final TentativaSimuladoRepository tentativaRepository;
    private final SimuladoRepository simuladoRepository;
    private final UsuarioRepository usuarioRepository;
    private final QuestaoRepository questaoRepository;
    private final MotorCorrecaoCebraspe motorCorrecaoCebraspe;

    /**
     * Inicia uma nova sessao de simulado para o aluno autenticado, disparando o cronometro
     * e inicializando as respostas em branco com telemetria zerada.
     */
    @Transactional
    public TentativaResponseDTO iniciarTentativa(Long simuladoId, Long usuarioId) {
        log.info("Iniciando sessao de simulado. Simulado ID: {}, Usuario ID: {}", simuladoId, usuarioId);

        Usuario usuario = usuarioRepository.findById(usuarioId)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario", usuarioId));

        Simulado simulado = simuladoRepository.findByIdComItensEQuestoes(simuladoId)
                .orElseThrow(() -> new ResourceNotFoundException("Simulado", simuladoId));

        TentativaSimulado tentativa = TentativaSimulado.builder()
                .usuario(usuario)
                .simulado(simulado)
                .status(StatusTentativa.EM_ANDAMENTO)
                .dataInicio(LocalDateTime.now())
                .pontuacaoLiquida(BigDecimal.ZERO.setScale(2))
                .respostas(new ArrayList<>())
                .build();

        // Inicializar a grade de respostas associada aos itens do simulado
        for (ItemSimulado item : simulado.getItens()) {
            RespostaTentativa resp = RespostaTentativa.builder()
                    .tentativa(tentativa)
                    .questao(item.getQuestao())
                    .respostaMarcada(null) // Inicialmente em branco
                    .tempoGastoSegundos(0)
                    .pontosAtribuidos(BigDecimal.ZERO.setScale(2))
                    .build();
            tentativa.addResposta(resp);
        }

        TentativaSimulado salva = tentativaRepository.save(tentativa);
        log.info("Tentativa ID: {} iniciada com sucesso para o aluno ID: {}", salva.getId(), usuarioId);
        return TentativaResponseDTO.fromEntity(salva);
    }

    /**
     * Registra ou atualiza uma marcacao individual em tempo real com sua respectiva telemetria de segundos.
     */
    @Transactional
    public TentativaResponseDTO registrarRespostaItem(Long tentativaId, Long usuarioId, RegistrarRespostaRequest request) {
        TentativaSimulado tentativa = validarEBuscarTentativaEmAndamento(tentativaId, usuarioId);

        Questao questao = questaoRepository.findById(request.questaoId())
                .orElseThrow(() -> new ResourceNotFoundException("Questao", request.questaoId()));

        Optional<RespostaTentativa> respostaExistente = tentativa.getRespostas().stream()
                .filter(r -> r.getQuestao() != null && Objects.equals(r.getQuestao().getId(), request.questaoId()))
                .findFirst();

        String marcacao = (request.respostaMarcada() != null && !request.respostaMarcada().isBlank())
                ? request.respostaMarcada().trim().toUpperCase()
                : null;

        int tempo = (request.tempoGastoSegundos() != null) ? request.tempoGastoSegundos() : 0;

        if (respostaExistente.isPresent()) {
            RespostaTentativa resp = respostaExistente.get();
            resp.setRespostaMarcada(marcacao);
            resp.setTempoGastoSegundos(tempo);
        } else {
            RespostaTentativa novaResp = RespostaTentativa.builder()
                    .tentativa(tentativa)
                    .questao(questao)
                    .respostaMarcada(marcacao)
                    .tempoGastoSegundos(tempo)
                    .pontosAtribuidos(BigDecimal.ZERO.setScale(2))
                    .build();
            tentativa.addResposta(novaResp);
        }

        TentativaSimulado salva = tentativaRepository.save(tentativa);
        return TentativaResponseDTO.fromEntity(salva);
    }

    /**
     * Finaliza a sessao de simulado, calcula a duracao total em segundos,
     * submete para a engine Cebraspe e consolida o resultado do aluno.
     */
    @Transactional
    public ResultadoTentativaDetalhadoDTO finalizarESubmeter(Long tentativaId, Long usuarioId, SubmeterTentativaRequest request) {
        log.info("Finalizando e submetendo tentativa ID: {} do aluno ID: {}", tentativaId, usuarioId);

        TentativaSimulado tentativa = tentativaRepository.findByIdComRespostasEQuestoes(tentativaId)
                .orElseThrow(() -> new ResourceNotFoundException("TentativaSimulado", tentativaId));

        validarPropriedadeDoUsuario(tentativa, usuarioId);

        if (tentativa.isFinalizada()) {
            throw new BusinessException("Esta tentativa de simulado ja foi finalizada anteriormente.");
        }

        // Se o cliente enviou o lote completo de respostas no momento da submissao
        if (request != null && request.respostas() != null && !request.respostas().isEmpty()) {
            for (RegistrarRespostaRequest itemResp : request.respostas()) {
                aplicarRespostaNaTentativa(tentativa, itemResp);
            }
        }

        LocalDateTime agora = LocalDateTime.now();
        tentativa.setDataFim(agora);

        int segundosTotais = (int) Duration.between(tentativa.getDataInicio(), agora).toSeconds();
        tentativa.setTempoTotalSegundos(segundosTotais);

        // Processar correcao pelo motor matematico Cebraspe
        motorCorrecaoCebraspe.processarCorrecao(tentativa);

        tentativa.setStatus(StatusTentativa.FINALIZADA);
        TentativaSimulado salva = tentativaRepository.save(tentativa);

        log.info("Tentativa ID: {} finalizada com sucesso! Nota Liquida: {}, Duracao: {}s",
                salva.getId(), salva.getPontuacaoLiquida(), salva.getTempoTotalSegundos());

        return ResultadoTentativaDetalhadoDTO.fromEntity(salva);
    }

    /**
     * Consulta o relatorio completo de desempenho de uma tentativa ja concluida.
     */
    public ResultadoTentativaDetalhadoDTO buscarResultadoTentativa(Long tentativaId, Long usuarioId) {
        TentativaSimulado tentativa = tentativaRepository.findByIdComRespostasEQuestoes(tentativaId)
                .orElseThrow(() -> new ResourceNotFoundException("TentativaSimulado", tentativaId));

        validarPropriedadeDoUsuario(tentativa, usuarioId);
        return ResultadoTentativaDetalhadoDTO.fromEntity(tentativa);
    }

    /**
     * Lista o historico cronologico decrescente de todas as tentativas realizadas pelo aluno.
     */
    public List<TentativaResponseDTO> listarHistoricoUsuario(Long usuarioId) {
        List<TentativaSimulado> tentativas = tentativaRepository.findByUsuarioIdOrderByDataInicioDesc(usuarioId);
        return tentativas.stream()
                .map(TentativaResponseDTO::fromEntity)
                .toList();
    }

    private TentativaSimulado validarEBuscarTentativaEmAndamento(Long tentativaId, Long usuarioId) {
        TentativaSimulado tentativa = tentativaRepository.findById(tentativaId)
                .orElseThrow(() -> new ResourceNotFoundException("TentativaSimulado", tentativaId));

        validarPropriedadeDoUsuario(tentativa, usuarioId);

        if (tentativa.isFinalizada()) {
            throw new BusinessException("A tentativa ja se encontra finalizada. Nao e permitido alterar respostas.");
        }
        return tentativa;
    }

    private void validarPropriedadeDoUsuario(TentativaSimulado tentativa, Long usuarioId) {
        if (tentativa.getUsuario() == null || !Objects.equals(tentativa.getUsuario().getId(), usuarioId)) {
            throw new BusinessException("Acesso negado: a tentativa nao pertence ao usuario autenticado.");
        }
    }

    private void aplicarRespostaNaTentativa(TentativaSimulado tentativa, RegistrarRespostaRequest itemResp) {
        String marcacao = (itemResp.respostaMarcada() != null && !itemResp.respostaMarcada().isBlank())
                ? itemResp.respostaMarcada().trim().toUpperCase()
                : null;

        int tempo = (itemResp.tempoGastoSegundos() != null) ? itemResp.tempoGastoSegundos() : 0;

        Optional<RespostaTentativa> existente = tentativa.getRespostas().stream()
                .filter(r -> r.getQuestao() != null && Objects.equals(r.getQuestao().getId(), itemResp.questaoId()))
                .findFirst();

        if (existente.isPresent()) {
            RespostaTentativa resp = existente.get();
            resp.setRespostaMarcada(marcacao);
            resp.setTempoGastoSegundos(tempo);
        } else {
            Questao q = questaoRepository.findById(itemResp.questaoId()).orElse(null);
            if (q != null) {
                RespostaTentativa nova = RespostaTentativa.builder()
                        .tentativa(tentativa)
                        .questao(q)
                        .respostaMarcada(marcacao)
                        .tempoGastoSegundos(tempo)
                        .pontosAtribuidos(BigDecimal.ZERO.setScale(2))
                        .build();
                tentativa.addResposta(nova);
            }
        }
    }
}
