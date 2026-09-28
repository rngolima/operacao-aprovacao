package com.operacaoaprovacao.api.modules.treinamento.domain.repository;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.Simulado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio de dados para a entidade Simulado.
 */
@Repository
public interface SimuladoRepository extends JpaRepository<Simulado, Long> {

    List<Simulado> findByModo(ModoSimulado modo);

    List<Simulado> findByConcursoId(Long concursoId);

    @Query("SELECT DISTINCT s FROM Simulado s LEFT JOIN FETCH s.itens i LEFT JOIN FETCH i.questao q WHERE s.id = :id")
    Optional<Simulado> findByIdComItensEQuestoes(@Param("id") Long id);
}
