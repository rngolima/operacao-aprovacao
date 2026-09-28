package com.operacaoaprovacao.api.modules.certame;

import com.operacaoaprovacao.api.modules.certame.application.dto.BancaResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.ConcursoResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.DisciplinaTreeResponse;
import com.operacaoaprovacao.api.modules.certame.application.service.CertameService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
class CertameControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CertameService certameService;

    @Test
    @DisplayName("GET /api/v1/certames/bancas deve retornar lista de bancas públicas com HTTP 200")
    void deveListarBancasPublicamente() throws Exception {
        BancaResponse banca = BancaResponse.builder()
                .id(1L)
                .nome("Cebraspe")
                .sigla("CEBRASPE")
                .siteOficial("https://cebraspe.org.br")
                .build();

        when(certameService.listarBancas()).thenReturn(List.of(banca));

        mockMvc.perform(get("/api/v1/certames/bancas")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data[0].sigla").value("CEBRASPE"));
    }

    @Test
    @DisplayName("GET /api/v1/certames/concursos com filtro por estado deve retornar HTTP 200")
    void deveListarConcursosPorEstado() throws Exception {
        ConcursoResponse concurso = ConcursoResponse.builder()
                .id(10L)
                .bancaSigla("CEBRASPE")
                .orgao("Policia Civil de Pernambuco")
                .estado("PE")
                .ano(2024)
                .build();

        when(certameService.listarConcursosPorEstado("PE")).thenReturn(List.of(concurso));

        mockMvc.perform(get("/api/v1/certames/concursos?estado=PE")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data[0].estado").value("PE"))
                .andExpect(jsonPath("$.data[0].orgao").value("Policia Civil de Pernambuco"));
    }

    @Test
    @DisplayName("GET /api/v1/certames/disciplinas/arvore deve retornar a arvore hierarquica com HTTP 200")
    void deveObterArvoreDisciplinas() throws Exception {
        DisciplinaTreeResponse arvore = DisciplinaTreeResponse.builder()
                .id(1L)
                .nome("Direito Processual Penal")
                .codigo("DPPR")
                .assuntos(List.of(
                        DisciplinaTreeResponse.AssuntoResponse.builder().id(100L).nome("Inquerito Policial").build()
                ))
                .build();

        when(certameService.obterArvoreDisciplinas()).thenReturn(List.of(arvore));

        mockMvc.perform(get("/api/v1/certames/disciplinas/arvore")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data[0].nome").value("Direito Processual Penal"))
                .andExpect(jsonPath("$.data[0].assuntos[0].nome").value("Inquerito Policial"));
    }
}
