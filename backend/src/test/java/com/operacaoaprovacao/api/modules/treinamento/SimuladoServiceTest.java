package com.operacaoaprovacao.api.modules.treinamento;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.repository.ConcursoRepository;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.CriarSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.ItemSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.SimuladoResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.service.SimuladoService;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.Simulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.SimuladoRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("Testes Unitários - SimuladoService")
class SimuladoServiceTest {

    @Mock
    private SimuladoRepository simuladoRepository;

    @Mock
    private QuestaoRepository questaoRepository;

    @Mock
    private ConcursoRepository concursoRepository;

    @InjectMocks
    private SimuladoService simuladoService;

    @Test
    @DisplayName("Deve criar um simulado com itens ordenados e salvar com sucesso")
    void deveCriarSimuladoComSucesso() {
        Concurso concurso = Concurso.builder().id(1L).orgao("PC-PE").build();
        Questao q1 = Questao.builder().id(101L).enunciado("Questao 1").build();
        Questao q2 = Questao.builder().id(102L).enunciado("Questao 2").build();

        CriarSimuladoRequest request = new CriarSimuladoRequest(
                "Simulado 01 PC-PE",
                "Descricao teste",
                1L,
                ModoSimulado.PROVA_COMPLETA,
                270,
                List.of(
                        new ItemSimuladoRequest(101L, 1, BigDecimal.valueOf(1.00)),
                        new ItemSimuladoRequest(102L, 2, BigDecimal.valueOf(1.00))
                )
        );

        when(concursoRepository.findById(1L)).thenReturn(Optional.of(concurso));
        when(questaoRepository.findAllById(List.of(101L, 102L))).thenReturn(List.of(q1, q2));
        when(simuladoRepository.save(any(Simulado.class))).thenAnswer(invocation -> {
            Simulado s = invocation.getArgument(0);
            s.setId(10L);
            return s;
        });

        SimuladoResponseDTO response = simuladoService.criarSimulado(request);

        assertThat(response).isNotNull();
        assertThat(response.id()).isEqualTo(10L);
        assertThat(response.titulo()).isEqualTo("Simulado 01 PC-PE");
        assertThat(response.totalQuestoes()).isEqualTo(2);
        assertThat(response.itens()).hasSize(2);
        verify(simuladoRepository, times(1)).save(any(Simulado.class));
    }

    @Test
    @DisplayName("Deve lancar BusinessException quando questao informada nao for encontrada")
    void deveLancarExcecaoAoCriarSimuladoComQuestoesInexistentes() {
        CriarSimuladoRequest request = new CriarSimuladoRequest(
                "Simulado Invalido",
                "Descricao",
                null,
                ModoSimulado.POR_DISCIPLINA,
                60,
                List.of(new ItemSimuladoRequest(999L, 1, BigDecimal.ONE))
        );

        when(questaoRepository.findAllById(List.of(999L))).thenReturn(List.of()); // Vazio

        assertThatThrownBy(() -> simuladoService.criarSimulado(request))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("nao foram encontradas");

        verify(simuladoRepository, never()).save(any());
    }

    @Test
    @DisplayName("Deve buscar simulado por ID com itens e questoes")
    void deveBuscarSimuladoPorId() {
        Simulado simulado = Simulado.builder()
                .id(1L)
                .titulo("Simulado PC-PE")
                .totalQuestoes(0)
                .itens(new ArrayList<>())
                .build();

        when(simuladoRepository.findByIdComItensEQuestoes(1L)).thenReturn(Optional.of(simulado));

        SimuladoResponseDTO dto = simuladoService.buscarPorId(1L);

        assertThat(dto).isNotNull();
        assertThat(dto.id()).isEqualTo(1L);
        assertThat(dto.titulo()).isEqualTo("Simulado PC-PE");
    }

    @Test
    @DisplayName("Deve lancar ResourceNotFoundException quando simulado nao existir")
    void deveLancarExcecaoQuandoSimuladoNaoExistir() {
        when(simuladoRepository.findByIdComItensEQuestoes(99L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> simuladoService.buscarPorId(99L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("Simulado");
    }

    @Test
    @DisplayName("Deve gerar simulado no formato oficial PC-PE automaticamente")
    void deveGerarSimuladoPcPeAutomaticamente() {
        Concurso concurso = Concurso.builder().id(1L).orgao("PC-PE").build();
        Questao q1 = Questao.builder().id(101L).build();
        Questao q2 = Questao.builder().id(102L).build();

        when(concursoRepository.findById(1L)).thenReturn(Optional.of(concurso));
        when(questaoRepository.findByConcursoId(1L)).thenReturn(List.of(q1, q2));
        when(simuladoRepository.save(any(Simulado.class))).thenAnswer(invocation -> {
            Simulado s = invocation.getArgument(0);
            s.setId(20L);
            return s;
        });

        SimuladoResponseDTO dto = simuladoService.gerarSimuladoPcPe(1L, "Simulado Turbo PC-PE", null);

        assertThat(dto).isNotNull();
        assertThat(dto.id()).isEqualTo(20L);
        assertThat(dto.tempoLimiteMinutos()).isEqualTo(270);
        assertThat(dto.totalQuestoes()).isEqualTo(2);
        verify(simuladoRepository).save(any(Simulado.class));
    }
}
