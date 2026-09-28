package com.operacaoaprovacao.api.modules.treinamento;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.auth.domain.repository.UsuarioRepository;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.RegistrarRespostaRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.ResultadoTentativaDetalhadoDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.SubmeterTentativaRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.TentativaResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.service.TentativaService;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.*;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.SimuladoRepository;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.TentativaSimuladoRepository;
import com.operacaoaprovacao.api.modules.treinamento.domain.service.MotorCorrecaoCebraspe;
import com.operacaoaprovacao.api.modules.treinamento.domain.service.ResultadoCorrecaoCebraspe;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("Testes Unitários - TentativaService")
class TentativaServiceTest {

    @Mock
    private TentativaSimuladoRepository tentativaRepository;

    @Mock
    private SimuladoRepository simuladoRepository;

    @Mock
    private UsuarioRepository usuarioRepository;

    @Mock
    private QuestaoRepository questaoRepository;

    @Mock
    private MotorCorrecaoCebraspe motorCorrecaoCebraspe;

    @InjectMocks
    private TentativaService tentativaService;

    @Test
    @DisplayName("Deve iniciar uma nova tentativa populando as respostas com valores iniciais zerados")
    void deveIniciarTentativaComGradeDeRespostasZerada() {
        Usuario usuario = Usuario.builder().id(1L).nome("Rudson").build();
        Questao q1 = Questao.builder().id(10L).build();

        Simulado simulado = Simulado.builder()
                .id(5L)
                .titulo("Simulado PC-PE 01")
                .totalQuestoes(1)
                .itens(new ArrayList<>())
                .build();

        ItemSimulado item1 = ItemSimulado.builder()
                .id(1L)
                .simulado(simulado)
                .questao(q1)
                .numeroQuestao(1)
                .peso(BigDecimal.ONE)
                .build();
        simulado.addItem(item1);

        when(usuarioRepository.findById(1L)).thenReturn(Optional.of(usuario));
        when(simuladoRepository.findByIdComItensEQuestoes(5L)).thenReturn(Optional.of(simulado));
        when(tentativaRepository.save(any(TentativaSimulado.class))).thenAnswer(inv -> {
            TentativaSimulado t = inv.getArgument(0);
            t.setId(100L);
            return t;
        });

        TentativaResponseDTO response = tentativaService.iniciarTentativa(5L, 1L);

        assertThat(response).isNotNull();
        assertThat(response.id()).isEqualTo(100L);
        assertThat(response.status()).isEqualTo(StatusTentativa.EM_ANDAMENTO);
        assertThat(response.simuladoTitulo()).isEqualTo("Simulado PC-PE 01");
        verify(tentativaRepository).save(any(TentativaSimulado.class));
    }

    @Test
    @DisplayName("Deve registrar uma marcacao individual em tempo real com telemetria")
    void deveRegistrarRespostaItemComTelemetria() {
        Usuario usuario = Usuario.builder().id(1L).build();
        Questao q = Questao.builder().id(10L).build();

        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(100L)
                .usuario(usuario)
                .status(StatusTentativa.EM_ANDAMENTO)
                .respostas(new ArrayList<>())
                .build();

        RespostaTentativa resp = RespostaTentativa.builder()
                .id(1L)
                .tentativa(tentativa)
                .questao(q)
                .respostaMarcada(null)
                .tempoGastoSegundos(0)
                .build();
        tentativa.addResposta(resp);

        when(tentativaRepository.findById(100L)).thenReturn(Optional.of(tentativa));
        when(questaoRepository.findById(10L)).thenReturn(Optional.of(q));
        when(tentativaRepository.save(any(TentativaSimulado.class))).thenAnswer(inv -> inv.getArgument(0));

        RegistrarRespostaRequest request = new RegistrarRespostaRequest(10L, "c", 45); // Telemetria 45s

        TentativaResponseDTO response = tentativaService.registrarRespostaItem(100L, 1L, request);

        assertThat(response).isNotNull();
        assertThat(resp.getRespostaMarcada()).isEqualTo("C");
        assertThat(resp.getTempoGastoSegundos()).isEqualTo(45);
        verify(tentativaRepository).save(tentativa);
    }

    @Test
    @DisplayName("Deve impedir alteracao de resposta quando a tentativa ja estiver finalizada")
    void deveImpedirRegistroDeRespostaEmTentativaJaFinalizada() {
        Usuario usuario = Usuario.builder().id(1L).build();
        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(100L)
                .usuario(usuario)
                .status(StatusTentativa.FINALIZADA)
                .build();

        when(tentativaRepository.findById(100L)).thenReturn(Optional.of(tentativa));

        RegistrarRespostaRequest request = new RegistrarRespostaRequest(10L, "C", 30);

        assertThatThrownBy(() -> tentativaService.registrarRespostaItem(100L, 1L, request))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("finalizada");

        verify(tentativaRepository, never()).save(any());
    }

    @Test
    @DisplayName("Deve finalizar e submeter tentativa chamando o MotorCorrecaoCebraspe com sucesso")
    void deveFinalizarESubmeterTentativaComSucessoChamamdoMotorCebraspe() {
        Usuario usuario = Usuario.builder().id(1L).build();
        Simulado simulado = Simulado.builder().id(1L).titulo("Simulado PC-PE").totalQuestoes(1).build();

        Questao q = Questao.builder().id(10L).tipo(TipoQuestao.CERTO_ERRADO).gabaritoOficial("C").build();

        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(100L)
                .usuario(usuario)
                .simulado(simulado)
                .status(StatusTentativa.EM_ANDAMENTO)
                .dataInicio(LocalDateTime.now().minusMinutes(20))
                .respostas(new ArrayList<>())
                .build();

        RespostaTentativa resp = RespostaTentativa.builder()
                .tentativa(tentativa)
                .questao(q)
                .respostaMarcada("C")
                .tempoGastoSegundos(60)
                .build();
        tentativa.addResposta(resp);

        when(tentativaRepository.findByIdComRespostasEQuestoes(100L)).thenReturn(Optional.of(tentativa));
        when(motorCorrecaoCebraspe.processarCorrecao(tentativa)).thenReturn(
                new ResultadoCorrecaoCebraspe(BigDecimal.valueOf(1.00), 1, 0, 0, 0, 1)
        );
        when(tentativaRepository.save(any(TentativaSimulado.class))).thenAnswer(inv -> inv.getArgument(0));

        SubmeterTentativaRequest submitReq = new SubmeterTentativaRequest(null);

        ResultadoTentativaDetalhadoDTO resultado = tentativaService.finalizarESubmeter(100L, 1L, submitReq);

        assertThat(resultado).isNotNull();
        assertThat(resultado.status()).isEqualTo(StatusTentativa.FINALIZADA);
        assertThat(resultado.tempoTotalSegundos()).isGreaterThan(0);
        verify(motorCorrecaoCebraspe).processarCorrecao(tentativa);
        verify(tentativaRepository).save(tentativa);
    }

    @Test
    @DisplayName("Deve lancar BusinessException se o usuario tentar acessar tentativa de outro candidato")
    void deveLancarExcecaoSeUsuarioNaoForDonoDaTentativa() {
        Usuario usuarioOutro = Usuario.builder().id(2L).build();
        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(100L)
                .usuario(usuarioOutro)
                .status(StatusTentativa.EM_ANDAMENTO)
                .build();

        when(tentativaRepository.findById(100L)).thenReturn(Optional.of(tentativa));

        RegistrarRespostaRequest req = new RegistrarRespostaRequest(10L, "C", 20);

        // Aluno ID 1 tentando alterar tentativa do Aluno ID 2
        assertThatThrownBy(() -> tentativaService.registrarRespostaItem(100L, 1L, req))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("Acesso negado");
    }
}
