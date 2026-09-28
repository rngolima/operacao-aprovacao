package com.operacaoaprovacao.api.modules.certame.domain.repository;

import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.StatusConcurso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repositorio de dados para a entidade Concurso.
 */
@Repository
public interface ConcursoRepository extends JpaRepository<Concurso, Long> {

    List<Concurso> findByEstado(String estado);

    List<Concurso> findByBancaId(Long bancaId);

    List<Concurso> findByStatus(StatusConcurso status);

    List<Concurso> findByOrgaoContainingIgnoreCase(String orgao);
}
