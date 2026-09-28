package com.operacaoaprovacao.api.modules.treinamento;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.CriarSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.ItemSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.SimuladoResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.service.SimuladoService;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
@DisplayName("Testes de Integração Web - SimuladoController")
class SimuladoControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private SimuladoService simuladoService;

    @Test
    @DisplayName("GET /api/v1/simulados/{id} deve retornar simulado com HTTP 200")
    void deveBuscarSimuladoPorId() throws Exception {
        SimuladoResponseDTO response = SimuladoResponseDTO.builder()
                .id(1L)
                .titulo("Simulado Oficial PC-PE 01")
                .modo(ModoSimulado.PROVA_COMPLETA)
                .tempoLimiteMinutos(270)
                .totalQuestoes(60)
                .build();

        when(simuladoService.buscarPorId(1L)).thenReturn(response);

        mockMvc.perform(get("/api/v1/simulados/1")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(1L))
                .andExpect(jsonPath("$.data.titulo").value("Simulado Oficial PC-PE 01"))
                .andExpect(jsonPath("$.data.tempoLimiteMinutos").value(270));
    }

    @Test
    @DisplayName("GET /api/v1/simulados deve listar cadernos com HTTP 200")
    void deveListarSimulados() throws Exception {
        SimuladoResponseDTO response = SimuladoResponseDTO.builder()
                .id(1L)
                .titulo("Simulado Geral")
                .modo(ModoSimulado.PROVA_COMPLETA)
                .build();

        when(simuladoService.listarTodos(null)).thenReturn(List.of(response));

        mockMvc.perform(get("/api/v1/simulados")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data[0].id").value(1L));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    @DisplayName("POST /api/v1/simulados com ADMIN deve criar simulado e retornar HTTP 201")
    void deveCriarSimuladoComAdmin() throws Exception {
        CriarSimuladoRequest request = new CriarSimuladoRequest(
                "Simulado 01 PC-PE",
                "Descricao",
                1L,
                ModoSimulado.PROVA_COMPLETA,
                270,
                List.of(new ItemSimuladoRequest(10L, 1, BigDecimal.ONE))
        );

        SimuladoResponseDTO criada = SimuladoResponseDTO.builder()
                .id(50L)
                .titulo(request.titulo())
                .modo(request.modo())
                .totalQuestoes(1)
                .build();

        when(simuladoService.criarSimulado(any(CriarSimuladoRequest.class))).thenReturn(criada);

        mockMvc.perform(post("/api/v1/simulados")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(header().exists("Location"))
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(50L));
    }

    @Test
    @DisplayName("POST /api/v1/simulados sem autenticacao deve ser recusado com HTTP 403")
    void deveRecusarCriacaoSemAutenticacao() throws Exception {
        CriarSimuladoRequest request = new CriarSimuladoRequest(
                "Nao Autorizado",
                "Descricao",
                null,
                ModoSimulado.POR_DISCIPLINA,
                60,
                List.of(new ItemSimuladoRequest(1L, 1, BigDecimal.ONE))
        );

        mockMvc.perform(post("/api/v1/simulados")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isForbidden());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    @DisplayName("POST /api/v1/simulados/pc-pe/gerar com ADMIN deve retornar HTTP 201")
    void deveGerarSimuladoPcPeComAdmin() throws Exception {
        SimuladoResponseDTO gerado = SimuladoResponseDTO.builder()
                .id(20L)
                .titulo("Simulado Turbo PC-PE")
                .modo(ModoSimulado.PROVA_COMPLETA)
                .tempoLimiteMinutos(270)
                .totalQuestoes(60)
                .build();

        when(simuladoService.gerarSimuladoPcPe(eq(1L), any(), any())).thenReturn(gerado);

        mockMvc.perform(post("/api/v1/simulados/pc-pe/gerar?concursoId=1")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(20L))
                .andExpect(jsonPath("$.data.tempoLimiteMinutos").value(270));
    }
}
