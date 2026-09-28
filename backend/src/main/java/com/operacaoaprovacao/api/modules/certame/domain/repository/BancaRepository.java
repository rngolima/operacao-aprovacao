package com.operacaoaprovacao.api.modules.certame.domain.repository;

import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repositorio de dados para a entidade Banca com Derived Queries indexadas.
 */
@Repository
public interface BancaRepository extends JpaRepository<Banca, Long> {

    Optional<Banca> findBySiglaIgnoreCase(String sigla);

    boolean existsBySiglaIgnoreCase(String sigla);
}
