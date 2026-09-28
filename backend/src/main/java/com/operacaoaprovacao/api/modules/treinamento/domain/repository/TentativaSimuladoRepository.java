package com.operacaoaprovacao.api.modules.treinamento.domain.repository;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.StatusTentativa;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.TentativaSimulado;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio de dados para a entidade TentativaSimulado.
 */
@Repository
public interface TentativaSimuladoRepository extends JpaRepository<TentativaSimulado, Long> {

    List<TentativaSimulado> findByUsuarioIdOrderByDataInicioDesc(Long usuarioId);

    Page<TentativaSimulado> findByUsuarioId(Long usuarioId, Pageable pageable);

    List<TentativaSimulado> findBySimuladoId(Long simuladoId);

    @Query("SELECT t FROM TentativaSimulado t " +
           "LEFT JOIN FETCH t.respostas r " +
           "LEFT JOIN FETCH r.questao q " +
           "WHERE t.id = :id")
    Optional<TentativaSimulado> findByIdComRespostasEQuestoes(@Param("id") Long id);

    long countByUsuarioIdAndStatus(Long usuarioId, StatusTentativa status);
}
