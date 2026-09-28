package com.operacaoaprovacao.api.modules.treinamento.domain.repository;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.RespostaTentativa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repositorio de dados para a entidade RespostaTentativa.
 */
@Repository
public interface RespostaTentativaRepository extends JpaRepository<RespostaTentativa, Long> {

    List<RespostaTentativa> findByTentativaId(Long tentativaId);

    List<RespostaTentativa> findByQuestaoId(Long questaoId);
}
