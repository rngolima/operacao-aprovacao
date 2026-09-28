package com.operacaoaprovacao.api.modules.certame.domain.repository;

import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio de dados para a entidade Disciplina com suporte a consultas otimizadas.
 */
@Repository
public interface DisciplinaRepository extends JpaRepository<Disciplina, Long> {

    Optional<Disciplina> findByNomeIgnoreCase(String nome);

    Optional<Disciplina> findByCodigoIgnoreCase(String codigo);

    boolean existsByNomeIgnoreCase(String nome);

    /**
     * Consulta otimizada com JOIN FETCH que carrega a disciplina e todos os seus assuntos
     * em uma unica viagem de rede ao banco de dados, eliminando o problema do N+1.
     */
    @Query("SELECT DISTINCT d FROM Disciplina d LEFT JOIN FETCH d.assuntos ORDER BY d.nome ASC")
    List<Disciplina> findAllWithAssuntos();
}
