package com.operacaoaprovacao.api.modules.certame.domain.repository;

import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repositorio de dados para a entidade Assunto.
 */
@Repository
public interface AssuntoRepository extends JpaRepository<Assunto, Long> {

    List<Assunto> findByDisciplinaIdOrderByNomeAsc(Long disciplinaId);

    List<Assunto> findByNomeContainingIgnoreCase(String termo);
}
