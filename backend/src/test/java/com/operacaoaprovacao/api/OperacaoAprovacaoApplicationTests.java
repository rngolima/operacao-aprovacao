package com.operacaoaprovacao.api;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
class OperacaoAprovacaoApplicationTests {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @DisplayName("Deve carregar o contexto da aplicacao Spring Boot com sucesso")
    void contextLoads() {
    }

    @Test
    @DisplayName("Endpoint /api/v1/health deve responder HTTP 200 OK com status UP")
    void healthCheckShouldReturnOk() throws Exception {
        mockMvc.perform(get("/api/v1/health"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.status").value("UP"))
                .andExpect(jsonPath("$.data.service").value("operacao-aprovacao-api"));
    }
}