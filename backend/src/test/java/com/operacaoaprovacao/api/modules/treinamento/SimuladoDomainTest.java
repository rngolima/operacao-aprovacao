package com.operacaoaprovacao.api.modules.treinamento;

import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Testes Unitarios de Dominio para o modulo Treinamento (Simulado & Tentativas).
 * Execucao ultra-rapida na JVM sem dependencia de contexto Spring ou banco de dados.
 */
class SimuladoDomainTest {

    @Test
    @DisplayName("Deve construir Simulado com valores padrao e sincronizar itens bidirecionalmente")
    void deveConstruirSimuladoComItens() {
        Simulado simulado = Simulado.builder()
                .titulo("Simulado 01 - PC-PE Agente")
                .descricao("Simulado preparatorio com 60 questoes Cebraspe")
                .modo(ModoSimulado.PROVA_COMPLETA)
                .build();

        Questao q1 = Questao.builder().id(10L).enunciado("Questao 1").build();
        ItemSimulado item1 = ItemSimulado.builder()
                .numeroQuestao(1)
                .questao(q1)
                .peso(BigDecimal.valueOf(1.00))
                .build();

        simulado.addItem(item1);

        assertThat(simulado.getTitulo()).isEqualTo("Simulado 01 - PC-PE Agente");
        assertThat(simulado.getTempoLimiteMinutos()).isEqualTo(270);
        assertThat(simulado.getTotalQuestoes()).isEqualTo(60);
        assertThat(simulado.getItens()).hasSize(1);
        assertThat(simulado.getItens().get(0).getSimulado()).isEqualTo(simulado);
        assertThat(simulado.getItens().get(0).getNumeroQuestao()).isEqualTo(1);
    }

    @Test
    @DisplayName("Deve construir TentativaSimulado em andamento e sincronizar respostas com telemetria")
    void deveConstruirTentativaComRespostasETelemetria() {
        Usuario usuario = Usuario.builder().id(1L).nome("Candidato Teste").email("candidato@teste.com").build();
        Simulado simulado = Simulado.builder().id(5L).titulo("Simulado PC-PE").build();

        TentativaSimulado tentativa = TentativaSimulado.builder()
                .usuario(usuario)
                .simulado(simulado)
                .dataInicio(LocalDateTime.now())
                .build();

        Questao q1 = Questao.builder().id(101L).enunciado("Questao de Direito Penal").build();
        RespostaTentativa resposta = RespostaTentativa.builder()
                .questao(q1)
                .respostaMarcada("C")
                .tempoGastoSegundos(45)
                .correta(true)
                .pontosAtribuidos(BigDecimal.valueOf(1.00))
                .build();

        tentativa.addResposta(resposta);

        assertThat(tentativa.getStatus()).isEqualTo(StatusTentativa.EM_ANDAMENTO);
        assertThat(tentativa.isFinalizada()).isFalse();
        assertThat(tentativa.getRespostas()).hasSize(1);
        assertThat(tentativa.getRespostas().get(0).getTentativa()).isEqualTo(tentativa);
        assertThat(tentativa.getRespostas().get(0).getTempoGastoSegundos()).isEqualTo(45);
        assertThat(tentativa.getRespostas().get(0).isEmBranco()).isFalse();
    }

    @Test
    @DisplayName("Deve identificar corretamente quando a resposta foi deixada em branco (abstenção Cebraspe)")
    void deveIdentificarRespostaEmBranco() {
        RespostaTentativa respNula = RespostaTentativa.builder()
                .respostaMarcada(null)
                .tempoGastoSegundos(20)
                .build();

        RespostaTentativa respVazia = RespostaTentativa.builder()
                .respostaMarcada("   ")
                .tempoGastoSegundos(15)
                .build();

        RespostaTentativa respPreenchida = RespostaTentativa.builder()
                .respostaMarcada("E")
                .tempoGastoSegundos(30)
                .build();

        assertThat(respNula.isEmBranco()).isTrue();
        assertThat(respVazia.isEmBranco()).isTrue();
        assertThat(respPreenchida.isEmBranco()).isFalse();
    }
}
