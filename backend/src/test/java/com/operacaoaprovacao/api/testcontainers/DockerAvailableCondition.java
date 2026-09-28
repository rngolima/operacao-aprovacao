package com.operacaoaprovacao.api.testcontainers;

import org.junit.jupiter.api.extension.ConditionEvaluationResult;
import org.junit.jupiter.api.extension.ExecutionCondition;
import org.junit.jupiter.api.extension.ExtensionContext;
import org.testcontainers.DockerClientFactory;

/**
 * Condicao de execucao customizada do JUnit 5 que verifica dinamicamente
 * se o Docker daemon esta acessivel no ambiente host.
 *
 * Permite execucao obrigatoria no CI/CD (GitHub Actions) com container real,
 * mantendo compatibilidade com estacoes de desenvolvimento sem Docker local instalado.
 */
public class DockerAvailableCondition implements ExecutionCondition {

    @Override
    public ConditionEvaluationResult evaluateExecutionCondition(ExtensionContext context) {
        try {
            boolean dockerDisponivel = DockerClientFactory.instance().isDockerAvailable();
            if (dockerDisponivel) {
                return ConditionEvaluationResult.enabled("Docker daemon ativo. Executando testes reais com Testcontainers PostgreSQL.");
            } else {
                return ConditionEvaluationResult.disabled("Docker daemon indisponivel no host local. Ignorando testes Testcontainers com seguranca.");
            }
        } catch (Throwable t) {
            return ConditionEvaluationResult.disabled("Docker nao detectado no ambiente: " + t.getMessage());
        }
    }
}
