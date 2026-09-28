package com.operacaoaprovacao.api.modules.questao.application.service;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import com.operacaoaprovacao.api.modules.certame.domain.repository.AssuntoRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.BancaRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.ConcursoRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.DisciplinaRepository;
import com.operacaoaprovacao.api.modules.questao.application.dto.CriarQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.FiltroQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.QuestaoResponse;
import com.operacaoaprovacao.api.modules.questao.domain.model.Alternativa;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servico de aplicacao responsavel pelo ciclo de vida e consultas de Questoes de concursos.
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class QuestaoService {

    private final QuestaoRepository questaoRepository;
    private final BancaRepository bancaRepository;
    private final ConcursoRepository concursoRepository;
    private final DisciplinaRepository disciplinaRepository;
    private final AssuntoRepository assuntoRepository;

    public QuestaoResponse buscarPorId(Long id) {
        Questao questao = questaoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Questao nao encontrada com id: " + id));
        return QuestaoResponse.fromEntity(questao);
    }

    public Page<QuestaoResponse> listarComFiltros(FiltroQuestaoRequest filtro, Pageable pageable) {
        Long disciplinaId = (filtro != null) ? filtro.disciplinaId() : null;
        Long assuntoId = (filtro != null) ? filtro.assuntoId() : null;
        Long bancaId = (filtro != null) ? filtro.bancaId() : null;
        Integer ano = (filtro != null) ? filtro.ano() : null;
        TipoQuestao tipo = (filtro != null) ? filtro.tipo() : null;

        return questaoRepository.findComFiltros(disciplinaId, assuntoId, bancaId, ano, tipo, pageable)
                .map(QuestaoResponse::fromEntity);
    }

    @Transactional
    public QuestaoResponse criarQuestao(CriarQuestaoRequest request) {
        Banca banca = bancaRepository.findById(request.bancaId())
                .orElseThrow(() -> new ResourceNotFoundException("Banca examinadora nao encontrada com id: " + request.bancaId()));

        Disciplina disciplina = disciplinaRepository.findById(request.disciplinaId())
                .orElseThrow(() -> new ResourceNotFoundException("Disciplina nao encontrada com id: " + request.disciplinaId()));

        Assunto assunto = assuntoRepository.findById(request.assuntoId())
                .orElseThrow(() -> new ResourceNotFoundException("Assunto nao encontrado com id: " + request.assuntoId()));

        // Validacao de integridade hierarquica do dominio
        if (!assunto.getDisciplina().getId().equals(disciplina.getId())) {
            throw new BusinessException("O assunto '" + assunto.getNome() + "' nao pertence a disciplina '" + disciplina.getNome() + "'.");
        }

        Concurso concurso = null;
        if (request.concursoId() != null) {
            concurso = concursoRepository.findById(request.concursoId())
                    .orElseThrow(() -> new ResourceNotFoundException("Concurso nao encontrado com id: " + request.concursoId()));
        }

        // Validacoes especificas por tipo de questao
        validarRegrasPorTipo(request);

        Questao questao = Questao.builder()
                .banca(banca)
                .concurso(concurso)
                .disciplina(disciplina)
                .assunto(assunto)
                .enunciado(request.enunciado())
                .textoBase(request.textoBase())
                .tipo(request.tipo())
                .dificuldade(request.dificuldade())
                .ano(request.ano())
                .gabaritoOficial(request.gabaritoOficial().trim().toUpperCase())
                .justificativa(request.justificativa())
                .fundamentacaoLegal(request.fundamentacaoLegal())
                .jurisprudencia(request.jurisprudencia())
                .build();

        if (request.tipo() == TipoQuestao.MULTIPLA_ESCOLHA && request.alternativas() != null) {
            for (CriarQuestaoRequest.CriarAlternativaRequest altReq : request.alternativas()) {
                Alternativa alt = Alternativa.builder()
                        .letra(altReq.letra().trim().toUpperCase())
                        .texto(altReq.texto())
                        .correta(altReq.correta())
                        .explicacao(altReq.explicacao())
                        .build();
                questao.addAlternativa(alt);
            }
        }

        Questao salva = questaoRepository.save(questao);
        return QuestaoResponse.fromEntity(salva);
    }

    @Transactional
    public QuestaoResponse anularQuestao(Long id) {
        Questao questao = questaoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Questao nao encontrada com id: " + id));

        if (questao.isAnulada()) {
            throw new BusinessException("A questao já se encontra anulada.");
        }

        questao.setAnulada(true);
        questao.setGabaritoOficial("ANULADA");

        Questao atualizada = questaoRepository.save(questao);
        return QuestaoResponse.fromEntity(atualizada);
    }

    private void validarRegrasPorTipo(CriarQuestaoRequest request) {
        if (request.tipo() == TipoQuestao.CERTO_ERRADO) {
            String gabarito = request.gabaritoOficial().trim().toUpperCase();
            if (!gabarito.equals("C") && !gabarito.equals("E") && !gabarito.equals("CERTO") && !gabarito.equals("ERRADO")) {
                throw new BusinessException("Para questoes Certo/Errado, o gabarito oficial deve ser 'C' ou 'E'.");
            }
        } else if (request.tipo() == TipoQuestao.MULTIPLA_ESCOLHA) {
            if (request.alternativas() == null || request.alternativas().size() < 2) {
                throw new BusinessException("Questoes de multipla escolha devem conter pelo menos 2 alternativas.");
            }
            long corretas = request.alternativas().stream().filter(CriarQuestaoRequest.CriarAlternativaRequest::correta).count();
            if (corretas != 1) {
                throw new BusinessException("Questoes de multipla escolha devem ter exatamente uma alternativa correta cadastrada.");
            }
        }
    }
}
