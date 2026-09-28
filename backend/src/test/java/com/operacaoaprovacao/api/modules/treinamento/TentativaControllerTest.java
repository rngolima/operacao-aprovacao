package com.operacaoaprovacao.api.modules.treinamento;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.auth.domain.repository.UsuarioRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.*;
import com.operacaoaprovacao.api.modules.treinamento.application.service.TentativaService;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.StatusTentativa;
import org.junit.jupiter.api.BeforeEach;
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
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
@DisplayName("Testes de Integração Web - TentativaController")
class TentativaControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private TentativaService tentativaService;

    @MockBean
    private UsuarioRepository usuarioRepository;

    private Usuario usuarioTeste;

    @BeforeEach
    void setUp() {
        usuarioTeste = Usuario.builder()
                .id(1L)
                .nome("Rudson Candidato")
                .email("candidato@teste.com")
                .build();

        when(usuarioRepository.findByEmail("candidato@teste.com")).thenReturn(Optional.of(usuarioTeste));
    }

    @Test
    @WithMockUser(username = "candidato@teste.com")
    @DisplayName("POST /api/v1/tentativas/iniciar deve iniciar sessão e retornar HTTP 201")
    void deveIniciarTentativa() throws Exception {
        TentativaResponseDTO response = TentativaResponseDTO.builder()
                .id(100L)
                .simuladoId(1L)
                .simuladoTitulo("Simulado PC-PE 01")
                .status(StatusTentativa.EM_ANDAMENTO)
                .dataInicio(LocalDateTime.now())
                .totalQuestoes(60)
                .build();

        when(tentativaService.iniciarTentativa(1L, 1L)).thenReturn(response);

        mockMvc.perform(post("/api/v1/tentativas/iniciar?simuladoId=1")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(100L))
                .andExpect(jsonPath("$.data.status").value("EM_ANDAMENTO"));
    }

    @Test
    @WithMockUser(username = "candidato@teste.com")
    @DisplayName("PUT /api/v1/tentativas/{id}/respostas deve registrar auto-save com HTTP 200")
    void deveRegistrarRespostaItemComTelemetria() throws Exception {
        RegistrarRespostaRequest request = new RegistrarRespostaRequest(10L, "C", 45);

        TentativaResponseDTO response = TentativaResponseDTO.builder()
                .id(100L)
                .status(StatusTentativa.EM_ANDAMENTO)
                .build();

        when(tentativaService.registrarRespostaItem(eq(100L), eq(1L), any(RegistrarRespostaRequest.class)))
                .thenReturn(response);

        mockMvc.perform(put("/api/v1/tentativas/100/respostas")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(100L));
    }

    @Test
    @WithMockUser(username = "candidato@teste.com")
    @DisplayName("POST /api/v1/tentativas/{id}/submeter deve corrigir no Cebraspe e retornar HTTP 200")
    void deveSubmeterTentativaParaCorrecao() throws Exception {
        ResultadoTentativaDetalhadoDTO resultado = ResultadoTentativaDetalhadoDTO.builder()
                .id(100L)
                .simuladoTitulo("Simulado PC-PE 01")
                .status(StatusTentativa.FINALIZADA)
                .pontuacaoLiquida(BigDecimal.valueOf(35.00))
                .totalAcertos(45)
                .totalErros(10)
                .totalEmBranco(5)
                .totalAnuladas(0)
                .tempoTotalSegundos(10800)
                .build();

        when(tentativaService.finalizarESubmeter(eq(100L), eq(1L), any())).thenReturn(resultado);

        mockMvc.perform(post("/api/v1/tentativas/100/submeter")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.id").value(100L))
                .andExpect(jsonPath("$.data.status").value("FINALIZADA"))
                .andExpect(jsonPath("$.data.pontuacaoLiquida").value(35.00));
    }

    @Test
    @WithMockUser(username = "candidato@teste.com")
    @DisplayName("GET /api/v1/tentativas/{id}/resultado deve retornar boletim detalhado com HTTP 200")
    void deveBuscarResultadoTentativa() throws Exception {
        ResultadoTentativaDetalhadoDTO resultado = ResultadoTentativaDetalhadoDTO.builder()
                .id(100L)
                .status(StatusTentativa.FINALIZADA)
                .pontuacaoLiquida(BigDecimal.valueOf(40.00))
                .build();

        when(tentativaService.buscarResultadoTentativa(100L, 1L)).thenReturn(resultado);

        mockMvc.perform(get("/api/v1/tentativas/100/resultado")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.pontuacaoLiquida").value(40.00));
    }

    @Test
    @WithMockUser(username = "candidato@teste.com")
    @DisplayName("GET /api/v1/tentativas/historico deve listar histórico com HTTP 200")
    void deveListarHistoricoTentativas() throws Exception {
        TentativaResponseDTO dto = TentativaResponseDTO.builder()
                .id(100L)
                .simuladoTitulo("Simulado PC-PE 01")
                .status(StatusTentativa.FINALIZADA)
                .pontuacaoLiquida(BigDecimal.valueOf(42.00))
                .build();

        when(tentativaService.listarHistoricoUsuario(1L)).thenReturn(List.of(dto));

        mockMvc.perform(get("/api/v1/tentativas/historico")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data[0].id").value(100L));
    }
}
