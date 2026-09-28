package com.operacaoaprovacao.api.modules.treinamento.application.service;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.repository.ConcursoRepository;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.CriarSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.ItemSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.SimuladoResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ItemSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.Simulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.SimuladoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Servico de Aplicacao responsavel pela gestao e montagem de cadernos de Simulado.
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SimuladoService {

    private final SimuladoRepository simuladoRepository;
    private final QuestaoRepository questaoRepository;
    private final ConcursoRepository concursoRepository;

    /**
     * Cria manualmente um novo caderno de simulado com uma lista especifica de questoes.
     */
    @Transactional
    public SimuladoResponseDTO criarSimulado(CriarSimuladoRequest request) {
        log.info("Criando novo simulado: '{}', Modo: {}", request.titulo(), request.modo());

        Concurso concurso = null;
        if (request.concursoId() != null) {
            concurso = concursoRepository.findById(request.concursoId())
                    .orElseThrow(() -> new ResourceNotFoundException("Concurso", request.concursoId()));
        }

        // Buscar todas as questoes informadas em lote para alta performance
        List<Long> questaoIds = request.itens().stream()
                .map(ItemSimuladoRequest::questaoId)
                .toList();

        List<Questao> questoesEncontradas = questaoRepository.findAllById(questaoIds);
        if (questoesEncontradas.size() != questaoIds.size()) {
            throw new BusinessException("Uma ou mais questoes informadas nao foram encontradas no banco de dados.");
        }

        Map<Long, Questao> questaoMap = questoesEncontradas.stream()
                .collect(Collectors.toMap(Questao::getId, q -> q));

        Simulado simulado = Simulado.builder()
                .titulo(request.titulo())
                .descricao(request.descricao())
                .concurso(concurso)
                .modo(request.modo())
                .tempoLimiteMinutos(request.tempoLimiteMinutos())
                .totalQuestoes(request.itens().size())
                .itens(new ArrayList<>())
                .build();

        for (ItemSimuladoRequest itemReq : request.itens()) {
            Questao questao = questaoMap.get(itemReq.questaoId());
            BigDecimal peso = (itemReq.peso() != null)
                    ? itemReq.peso().setScale(2, RoundingMode.HALF_UP)
                    : BigDecimal.valueOf(1.00).setScale(2, RoundingMode.HALF_UP);

            ItemSimulado itemSimulado = ItemSimulado.builder()
                    .simulado(simulado)
                    .questao(questao)
                    .numeroQuestao(itemReq.numeroQuestao())
                    .peso(peso)
                    .build();

            simulado.addItem(itemSimulado);
        }

        Simulado salvo = simuladoRepository.save(simulado);
        log.info("Simulado salvo com sucesso com ID: {} e {} itens.", salvo.getId(), salvo.getTotalQuestoes());
        return SimuladoResponseDTO.fromEntity(salvo);
    }

    /**
     * Busca um simulado por ID carregando seus itens e questoes sem o problema de N+1 queries.
     */
    public SimuladoResponseDTO buscarPorId(Long id) {
        Simulado simulado = simuladoRepository.findByIdComItensEQuestoes(id)
                .orElseThrow(() -> new ResourceNotFoundException("Simulado", id));
        return SimuladoResponseDTO.fromEntity(simulado);
    }

    /**
     * Lista simulados cadastrados com filtro opcional por Modo.
     */
    public List<SimuladoResponseDTO> listarTodos(ModoSimulado modo) {
        List<Simulado> lista = (modo != null)
                ? simuladoRepository.findByModo(modo)
                : simuladoRepository.findAll();

        return lista.stream()
                .map(SimuladoResponseDTO::fromEntity)
                .toList();
    }

    /**
     * Algoritmo de montagem ponderada oficial para o certame da PC-PE (Agente/Escrivao).
     * Seleciona as questoes do banco de dados, compoe a grade oficial de 60 itens
     * e configura o tempo limite oficial de 270 minutos (4h30min).
     */
    @Transactional
    public SimuladoResponseDTO gerarSimuladoPcPe(Long concursoId, String titulo, String descricao) {
        log.info("Iniciando geracao automatica de simulado no formato oficial PC-PE. Concurso ID: {}", concursoId);

        Concurso concurso = concursoRepository.findById(concursoId)
                .orElseThrow(() -> new ResourceNotFoundException("Concurso", concursoId));

        // Buscar questoes vinculadas ao concurso ou disponiveis no banco
        List<Questao> questoesDisponiveis = questaoRepository.findByConcursoId(concursoId);
        if (questoesDisponiveis.isEmpty()) {
            questoesDisponiveis = questaoRepository.findAll();
        }

        if (questoesDisponiveis.isEmpty()) {
            throw new BusinessException("Nao ha questoes suficientes no banco para gerar o simulado da PC-PE.");
        }

        // Limitado a 60 questoes no formato do edital ou ao total disponivel
        int totalQuestoes = Math.min(questoesDisponiveis.size(), 60);
        List<Questao> questoesSelecionadas = questoesDisponiveis.subList(0, totalQuestoes);

        Simulado simulado = Simulado.builder()
                .titulo((titulo != null && !titulo.isBlank()) ? titulo : "Simulado Oficial PC-PE - " + concurso.getOrgao())
                .descricao((descricao != null && !descricao.isBlank()) ? descricao : "Simulado com 60 itens modelo Cebraspe (Certo/Errado) e tempo oficial de 4h30min.")
                .concurso(concurso)
                .modo(ModoSimulado.PROVA_COMPLETA)
                .tempoLimiteMinutos(270) // 4 horas e 30 minutos oficiais
                .totalQuestoes(totalQuestoes)
                .itens(new ArrayList<>())
                .build();

        int numero = 1;
        for (Questao q : questoesSelecionadas) {
            ItemSimulado item = ItemSimulado.builder()
                    .simulado(simulado)
                    .questao(q)
                    .numeroQuestao(numero++)
                    .peso(BigDecimal.valueOf(1.00).setScale(2, RoundingMode.HALF_UP))
                    .build();
            simulado.addItem(item);
        }

        Simulado salvo = simuladoRepository.save(simulado);
        log.info("Simulado automatico PC-PE gerado com sucesso! ID: {}, Total Itens: {}", salvo.getId(), salvo.getTotalQuestoes());
        return SimuladoResponseDTO.fromEntity(salvo);
    }
}
