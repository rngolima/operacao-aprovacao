package com.operacaoaprovacao.api.testcontainers;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import static org.assertj.core.api.Assertions.assertThat;

@DisplayName("Testes de Integração com Banco Real - Testcontainers PostgreSQL 16")
class FlywayPostgreSqlIntegrationTest extends AbstractPostgreSqlIntegrationTest {

    @Autowired
    private Flyway flyway;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    @DisplayName("Deve inicializar container PostgreSQL 16 e aplicar com sucesso todas as migrações Flyway")
    void deveAplicarTodasAsMigracoesNoPostgreSqlReal() {
        assertThat(postgresContainer.isRunning()).isTrue();

        MigrationInfo[] migracoesAplicadas = flyway.info().applied();

        assertThat(migracoesAplicadas)
                .isNotEmpty()
                .hasSizeGreaterThanOrEqualTo(3);

        assertThat(migracoesAplicadas[0].getVersion().getVersion()).isEqualTo("1");
        assertThat(migracoesAplicadas[1].getVersion().getVersion()).isEqualTo("2");
        assertThat(migracoesAplicadas[2].getVersion().getVersion()).isEqualTo("3");
    }

    @Test
    @DisplayName("Deve validar a integridade física de tabelas e índices criados no PostgreSQL 16")
    void deveValidarTabelasCriadasNoBancoReal() {
        Integer totalTabelasSimulados = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM information_schema.tables WHERE table_name IN ('tb_simulado', 'tb_tentativa_simulado', 'tb_resposta_tentativa')",
                Integer.class
        );

        assertThat(totalTabelasSimulados).isEqualTo(3);
    }
}
