package com.operacaoaprovacao.api;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É a classe de testes automatizados de integração que roda durante o build do Maven.
 * 
 * PARA QUE SERVE?
 * Serve para garantir a qualidade e a estabilidade da aplicação:
 * 1. Valida se o Spring Boot sobe sem quebrar nenhuma dependência ou configuração (Smoke Test).
 * 2. Simula requisições HTTP reais contra a nossa API (usando MockMvc) e valida se as respostas estão corretas.
 * 
 * POR QUE FOI CRIADO?
 * Código profissional sem testes automatizados não é aceito em empresas sérias. Os testes garantem
 * que quando adicionarmos novas funcionalidades nas próximas Sprints, nada do que já funcionava
 * será quebrado (evita regressão de bugs).
 * 
 * PERGUNTA DE ENTREVISTA (Nível Júnior/Pleno):
 * "O que é o MockMvc e qual a vantagem de usá-lo em testes de Controllers?"
 * RESPOSTA:
 * O MockMvc é uma ferramenta do Spring Test que permite testar toda a pilha de execução de um Controller
 * (roteamento, filtros de segurança, serialização JSON e validação) sem precisar subir um servidor
 * HTTP real em uma porta TCP, tornando a execução dos testes extremamente rápida e confiável.
 * =====================================================================================
 */

// Anotações do JUnit 5 (Jupyter), o framework de testes padrão oficial do Java moderno.
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

// Anotações do Spring Boot Test para carregar o contexto da aplicação e injetar dependências no teste.
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

// Métodos utilitários estáticos para construir requisições HTTP simuladas (get, post) e asserções (status, jsonPath).
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * @SpringBootTest: Sobe o contexto Spring completo para o teste (procura a classe com @SpringBootApplication).
 * @AutoConfigureMockMvc: Instancia e configura o MockMvc para simular chamadas de rede.
 * @ActiveProfiles("dev"): Garante que o teste use o perfil de desenvolvimento (banco H2 em memória).
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
class OperacaoAprovacaoApplicationTests {

    /**
     * Injeta automaticamente a ferramenta de simulação HTTP do Spring.
     */
    @Autowired
    private MockMvc mockMvc;

    /**
     * Teste básico de fumaça (Smoke Test). Se o Spring Boot não conseguir iniciar, este teste falha.
     */
    @Test
    @DisplayName("Deve carregar o contexto da aplicacao Spring Boot com sucesso")
    void contextLoads() {
        // Se este método rodar sem lançar exceções, o contexto subiu com perfeição.
    }

    /**
     * Teste de integração do endpoint /api/v1/health.
     * Faz um GET simulado e valida se o status HTTP é 200 e se o JSON retornado tem os valores esperados.
     */
    @Test
    @DisplayName("Endpoint /api/v1/health deve responder HTTP 200 OK com status UP")
    void healthCheckShouldReturnOk() throws Exception {
        mockMvc.perform(get("/api/v1/health"))
                // Valida se o status da resposta HTTP é 200 OK
                .andExpect(status().isOk())
                // Valida se no JSON o campo "success" é verdadeiro
                .andExpect(jsonPath("$.success").value(true))
                // Valida se dentro de "data" o campo "status" é "UP"
                .andExpect(jsonPath("$.data.status").value("UP"))
                // Valida se o nome do serviço é "operacao-aprovacao-api"
                .andExpect(jsonPath("$.data.service").value("operacao-aprovacao-api"));
    }
}