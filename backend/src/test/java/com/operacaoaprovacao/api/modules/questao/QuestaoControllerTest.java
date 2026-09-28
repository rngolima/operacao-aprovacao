package com.operacaoaprovacao.api.modules.questao;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.operacaoaprovacao.api.modules.questao.application.dto.CriarQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.QuestaoResponse;
import com.operacaoaprovacao.api.modules.questao.application.service.QuestaoService;
import com.operacaoaprovacao.api.modules.questao.domain.model.DificuldadeQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
class QuestaoControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private QuestaoService questaoService;

    @Test
    @DisplayName("GET /api/v1/questoes/{id} deve retornar questão com HTTP 200")
    void deveBuscarQuestaoPorId() throws Exception {
        QuestaoResponse response = QuestaoResponse.builder()
                .id(1L)
                .bancaSigla("CEBRASPE")
                .disciplinaNome("Direito Penal")
                .enunciado("O inquérito policial é dispensável.")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .ano(2024)
                .gabaritoOficial("C")
                .anulada(false)
                .build();

        when(questaoService.buscarPorId(1L)).thenReturn(response);

        mockMvc.perform(get("/api/v1/questoes/1")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(1L))
                .andExpect(jsonPath("$.data.gabaritoOficial").value("C"));
    }

    @Test
    @DisplayName("GET /api/v1/questoes deve retornar busca paginada com HTTP 200")
    void deveListarQuestoesPaginadas() throws Exception {
        QuestaoResponse response = QuestaoResponse.builder()
                .id(1L)
                .bancaSigla("CEBRASPE")
                .enunciado("Questão de teste")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .ano(2024)
                .gabaritoOficial("E")
                .build();

        when(questaoService.listarComFiltros(any(), any(Pageable.class)))
                .thenReturn(new PageImpl<>(List.of(response)));

        mockMvc.perform(get("/api/v1/questoes?page=0&size=10")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.content[0].id").value(1L));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    @DisplayName("POST /api/v1/questoes com usuário ADMIN deve criar questão e retornar HTTP 201")
    void deveCriarQuestaoComAdmin() throws Exception {
        CriarQuestaoRequest request = CriarQuestaoRequest.builder()
                .bancaId(1L)
                .disciplinaId(10L)
                .assuntoId(100L)
                .enunciado("A tipicidade formal exige subsunção perfeita.")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .dificuldade(DificuldadeQuestao.MEDIA)
                .ano(2024)
                .gabaritoOficial("C")
                .build();

        QuestaoResponse responseCriada = QuestaoResponse.builder()
                .id(50L)
                .bancaSigla("CEBRASPE")
                .enunciado(request.enunciado())
                .tipo(request.tipo())
                .ano(request.ano())
                .gabaritoOficial("C")
                .build();

        when(questaoService.criarQuestao(any(CriarQuestaoRequest.class))).thenReturn(responseCriada);

        mockMvc.perform(post("/api/v1/questoes")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(header().exists("Location"))
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(50L));
    }

    @Test
    @DisplayName("POST /api/v1/questoes sem autenticação deve ser recusado com HTTP 401 ou 403")
    void deveRecusarCriacaoSemAutenticacao() throws Exception {
        CriarQuestaoRequest request = CriarQuestaoRequest.builder()
                .bancaId(1L)
                .disciplinaId(10L)
                .assuntoId(100L)
                .enunciado("Tentativa não autorizada")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .dificuldade(DificuldadeQuestao.FACIL)
                .ano(2024)
                .gabaritoOficial("C")
                .build();

        mockMvc.perform(post("/api/v1/questoes")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isForbidden());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    @DisplayName("PATCH /api/v1/questoes/{id}/anular com ADMIN deve retornar HTTP 200")
    void deveAnularQuestaoComAdmin() throws Exception {
        QuestaoResponse responseAnulada = QuestaoResponse.builder()
                .id(1L)
                .anulada(true)
                .gabaritoOficial("ANULADA")
                .build();

        when(questaoService.anularQuestao(1L)).thenReturn(responseAnulada);

        mockMvc.perform(patch("/api/v1/questoes/1/anular")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.anulada").value(true))
                .andExpect(jsonPath("$.data.gabaritoOficial").value("ANULADA"));
    }
}
