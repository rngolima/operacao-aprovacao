package com.operacaoaprovacao.api.modules.certame.domain.repository;

import com.operacaoaprovacao.api.modules.certame.domain.model.Edital;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio de dados para a entidade Edital.
 */
@Repository
public interface EditalRepository extends JpaRepository<Edital, Long> {

    List<Edital> findByConcursoId(Long concursoId);

    Optional<Edital> findByConcursoIdAndNumero(Long concursoId, String numero);
}
