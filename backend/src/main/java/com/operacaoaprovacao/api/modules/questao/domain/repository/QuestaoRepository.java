package com.operacaoaprovacao.api.modules.questao.domain.repository;

import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repositorio de dados para a entidade Questao com suporte a filtros e paginacao.
 */
@Repository
public interface QuestaoRepository extends JpaRepository<Questao, Long> {

    Page<Questao> findByDisciplinaId(Long disciplinaId, Pageable pageable);

    Page<Questao> findByAssuntoId(Long assuntoId, Pageable pageable);

    Page<Questao> findByBancaId(Long bancaId, Pageable pageable);

    Page<Questao> findByTipo(TipoQuestao tipo, Pageable pageable);

    List<Questao> findByConcursoId(Long concursoId);

    @Query("SELECT q FROM Questao q WHERE " +
           "(:disciplinaId IS NULL OR q.disciplina.id = :disciplinaId) AND " +
           "(:assuntoId IS NULL OR q.assunto.id = :assuntoId) AND " +
           "(:bancaId IS NULL OR q.banca.id = :bancaId) AND " +
           "(:ano IS NULL OR q.ano = :ano) AND " +
           "(:tipo IS NULL OR q.tipo = :tipo)")
    Page<Questao> findComFiltros(
            @Param("disciplinaId") Long disciplinaId,
            @Param("assuntoId") Long assuntoId,
            @Param("bancaId") Long bancaId,
            @Param("ano") Integer ano,
            @Param("tipo") TipoQuestao tipo,
            Pageable pageable
    );

    long countByBancaId(Long bancaId);

    long countByDisciplinaId(Long disciplinaId);
}
