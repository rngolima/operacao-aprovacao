package com.operacaoaprovacao.api.modules.certame.application.service;

import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.certame.application.dto.BancaResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.ConcursoResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.DisciplinaTreeResponse;
import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import com.operacaoaprovacao.api.modules.certame.domain.repository.BancaRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.ConcursoRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.DisciplinaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Servico de aplicacao para o modulo de Certames.
 * Gerencia consultas a bancas examinadoras, concursos e a arvore de disciplinas.
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CertameService {

    private final BancaRepository bancaRepository;
    private final ConcursoRepository concursoRepository;
    private final DisciplinaRepository disciplinaRepository;

    public List<BancaResponse> listarBancas() {
        return bancaRepository.findAll()
                .stream()
                .map(BancaResponse::fromEntity)
                .toList();
    }

    public BancaResponse buscarBancaPorId(Long id) {
        Banca banca = bancaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Banca examinadora nao encontrada com id: " + id));
        return BancaResponse.fromEntity(banca);
    }

    public List<ConcursoResponse> listarConcursos() {
        return concursoRepository.findAll()
                .stream()
                .map(ConcursoResponse::fromEntity)
                .toList();
    }

    public List<ConcursoResponse> listarConcursosPorEstado(String estado) {
        return concursoRepository.findByEstado(estado)
                .stream()
                .map(ConcursoResponse::fromEntity)
                .toList();
    }

    public ConcursoResponse buscarConcursoPorId(Long id) {
        Concurso concurso = concursoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Concurso nao encontrado com id: " + id));
        return ConcursoResponse.fromEntity(concurso);
    }

    /**
     * Retorna a arvore de conhecimento completa (disciplinas e seus respectivos assuntos)
     * em uma unica query ao banco utilizando JOIN FETCH (zero problema N+1).
     */
    public List<DisciplinaTreeResponse> obterArvoreDisciplinas() {
        return disciplinaRepository.findAllWithAssuntos()
                .stream()
                .map(DisciplinaTreeResponse::fromEntity)
                .toList();
    }

    public DisciplinaTreeResponse buscarDisciplinaPorId(Long id) {
        Disciplina disciplina = disciplinaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Disciplina nao encontrada com id: " + id));
        return DisciplinaTreeResponse.fromEntity(disciplina);
    }
}
