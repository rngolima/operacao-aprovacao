package com.operacaoaprovacao.api.modules.questao.domain.repository;

import com.operacaoaprovacao.api.modules.questao.domain.model.Alternativa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repositorio de dados para a entidade Alternativa.
 */
@Repository
public interface AlternativaRepository extends JpaRepository<Alternativa, Long> {

    List<Alternativa> findByQuestaoIdOrderByLetraAsc(Long questaoId);
}
