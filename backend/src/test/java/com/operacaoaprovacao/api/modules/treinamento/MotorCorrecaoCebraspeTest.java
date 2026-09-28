package com.operacaoaprovacao.api.modules.treinamento;

import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ItemSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.RespostaTentativa;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.Simulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.TentativaSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.service.MotorCorrecaoCebraspe;
import com.operacaoaprovacao.api.modules.treinamento.domain.service.ResultadoCorrecaoCebraspe;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@DisplayName("Testes Unitários - Motor Matemático de Correção Cebraspe")
class MotorCorrecaoCebraspeTest {

    private MotorCorrecaoCebraspe motorCorrecao;

    @BeforeEach
    void setUp() {
        motorCorrecao = new MotorCorrecaoCebraspe();
    }

    private Questao criarQuestao(Long id, String gabarito, TipoQuestao tipo, boolean anulada) {
        return Questao.builder()
                .id(id)
                .gabaritoOficial(gabarito)
                .tipo(tipo)
                .anulada(anulada)
                .build();
    }

    private RespostaTentativa criarResposta(TentativaSimulado tentativa, Questao questao, String respostaMarcada) {
        RespostaTentativa resposta = RespostaTentativa.builder()
                .tentativa(tentativa)
                .questao(questao)
                .respostaMarcada(respostaMarcada)
                .build();
        tentativa.addResposta(resposta);
        return resposta;
    }

    @Test
    @DisplayName("Cenário 1: Deve calcular nota perfeita quando o candidato acertar 100% dos itens C/E")
    void deveCalcularNotaPerfeitaQuandoAlunoAcertarTodas() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(1L).respostas(new ArrayList<>()).build();

        Questao q1 = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q2 = criarQuestao(2L, "E", TipoQuestao.CERTO_ERRADO, false);
        Questao q3 = criarQuestao(3L, "C", TipoQuestao.CERTO_ERRADO, false);

        criarResposta(tentativa, q1, "C");
        criarResposta(tentativa, q2, "E");
        criarResposta(tentativa, q3, "C");

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAcertos()).isEqualTo(3);
        assertThat(resultado.totalErros()).isZero();
        assertThat(resultado.totalEmBranco()).isZero();
        assertThat(resultado.totalAnuladas()).isZero();
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("3.00");

        assertThat(tentativa.getPontuacaoLiquida()).isEqualByComparingTo("3.00");
    }

    @Test
    @DisplayName("Cenário 2: Regra Cebraspe 1 Errada Anula 1 Certa - 3 Certas e 2 Erradas = 1.00 Ponto Líquido")
    void deveAplicarRegraUmaErradaAnulaUmaCertaCorretamente() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(2L).respostas(new ArrayList<>()).build();

        Questao q1 = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q2 = criarQuestao(2L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q3 = criarQuestao(3L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q4 = criarQuestao(4L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q5 = criarQuestao(5L, "E", TipoQuestao.CERTO_ERRADO, false);

        criarResposta(tentativa, q1, "C"); // Acerto (+1)
        criarResposta(tentativa, q2, "C"); // Acerto (+1)
        criarResposta(tentativa, q3, "C"); // Acerto (+1)
        criarResposta(tentativa, q4, "E"); // Erro (-1)
        criarResposta(tentativa, q5, "C"); // Erro (-1)

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAcertos()).isEqualTo(3);
        assertThat(resultado.totalErros()).isEqualTo(2);
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("1.00");
        assertThat(tentativa.getPontuacaoLiquida()).isEqualByComparingTo("1.00");
    }

    @Test
    @DisplayName("Cenário 3: Empate Técnico Cebraspe - Acertos iguais a Erros resultam em Nota Líquida 0.00")
    void devePermitirNotaLiquidaZeroQuandoAcertosIgualamErros() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(3L).respostas(new ArrayList<>()).build();

        Questao q1 = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q2 = criarQuestao(2L, "E", TipoQuestao.CERTO_ERRADO, false);

        criarResposta(tentativa, q1, "C"); // Acerto (+1)
        criarResposta(tentativa, q2, "C"); // Erro (-1)

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAcertos()).isEqualTo(1);
        assertThat(resultado.totalErros()).isEqualTo(1);
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("0.00");
    }

    @Test
    @DisplayName("Cenário 4: Nota Líquida Negativa - Quando erros superam os acertos")
    void devePermitirNotaLiquidaNegativaQuandoErrosSuperamAcertos() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(4L).respostas(new ArrayList<>()).build();

        Questao q1 = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q2 = criarQuestao(2L, "E", TipoQuestao.CERTO_ERRADO, false);
        Questao q3 = criarQuestao(3L, "E", TipoQuestao.CERTO_ERRADO, false);
        Questao q4 = criarQuestao(4L, "C", TipoQuestao.CERTO_ERRADO, false);

        criarResposta(tentativa, q1, "C"); // Acerto (+1)
        criarResposta(tentativa, q2, "C"); // Erro (-1)
        criarResposta(tentativa, q3, "C"); // Erro (-1)
        criarResposta(tentativa, q4, "E"); // Erro (-1)

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAcertos()).isEqualTo(1);
        assertThat(resultado.totalErros()).isEqualTo(3);
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("-2.00");
    }

    @Test
    @DisplayName("Cenário 5: Abstenção Estratégica - Questões em branco pontuam 0.00 e não penalizam")
    void deveRespeitarAbstencaoEstrategicaQuandoQuestoesFicamEmBranco() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(5L).respostas(new ArrayList<>()).build();

        Questao q1 = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q2 = criarQuestao(2L, "E", TipoQuestao.CERTO_ERRADO, false);
        Questao q3 = criarQuestao(3L, "C", TipoQuestao.CERTO_ERRADO, false);

        criarResposta(tentativa, q1, "C");    // Acerto (+1)
        criarResposta(tentativa, q2, null);   // Branco (0)
        criarResposta(tentativa, q3, "   ");  // Branco (0)

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAcertos()).isEqualTo(1);
        assertThat(resultado.totalErros()).isZero();
        assertThat(resultado.totalEmBranco()).isEqualTo(2);
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("1.00");

        RespostaTentativa respEmBranco = tentativa.getRespostas().get(1);
        assertThat(respEmBranco.getCorreta()).isNull();
        assertThat(respEmBranco.getPontosAtribuidos()).isEqualByComparingTo("0.00");
    }

    @Test
    @DisplayName("Cenário 6: Questão Anulada pela Banca - Bonifica todos os candidatos com o peso do item")
    void deveBonificarTodosOsCandidatosComPesoDoItemQuandoQuestaoForAnuladaPelaBanca() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(6L).respostas(new ArrayList<>()).build();

        Questao qAnulada = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, true); // Anulada pela banca!
        Questao qNormal = criarQuestao(2L, "C", TipoQuestao.CERTO_ERRADO, false);

        // Candidato marcou errado na questão anulada, mas mesmo assim deve receber +1.00 ponto
        criarResposta(tentativa, qAnulada, "E");
        criarResposta(tentativa, qNormal, "C");

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAnuladas()).isEqualTo(1);
        assertThat(resultado.totalAcertos()).isEqualTo(1);
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("2.00");

        RespostaTentativa respAnulada = tentativa.getRespostas().get(0);
        assertThat(respAnulada.getPontosAtribuidos()).isEqualByComparingTo("1.00");
    }

    @Test
    @DisplayName("Cenário 7: Pesos Customizados - Respeita o peso definido em ItemSimulado")
    void deveRespeitarPesosCustomizadosDosItensDoSimulado() {
        Simulado simulado = Simulado.builder().id(10L).itens(new ArrayList<>()).build();
        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(7L)
                .simulado(simulado)
                .respostas(new ArrayList<>())
                .build();

        Questao q1 = criarQuestao(1L, "C", TipoQuestao.CERTO_ERRADO, false);
        Questao q2 = criarQuestao(2L, "C", TipoQuestao.CERTO_ERRADO, false);

        // Definindo peso 2.50 para a questão 1 e peso 1.50 para a questão 2
        ItemSimulado item1 = ItemSimulado.builder()
                .simulado(simulado)
                .questao(q1)
                .numeroQuestao(1)
                .peso(BigDecimal.valueOf(2.50).setScale(2, RoundingMode.HALF_UP))
                .build();

        ItemSimulado item2 = ItemSimulado.builder()
                .simulado(simulado)
                .questao(q2)
                .numeroQuestao(2)
                .peso(BigDecimal.valueOf(1.50).setScale(2, RoundingMode.HALF_UP))
                .build();

        simulado.getItens().add(item1);
        simulado.getItens().add(item2);

        criarResposta(tentativa, q1, "C"); // Acertou item com peso 2.50 (+2.50)
        criarResposta(tentativa, q2, "E"); // Errou item com peso 1.50 (-1.50)

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        // 2.50 - 1.50 = 1.00 líquido
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("1.00");
        assertThat(tentativa.getRespostas().get(0).getPontosAtribuidos()).isEqualByComparingTo("2.50");
        assertThat(tentativa.getRespostas().get(1).getPontosAtribuidos()).isEqualByComparingTo("-1.50");
    }

    @Test
    @DisplayName("Cenário 8: Questão de Múltipla Escolha - Acerto ganha ponto, Erro não gera penalidade")
    void deveProcessarQuestoesDeMultiplaEscolhaSemPenalizarErros() {
        TentativaSimulado tentativa = TentativaSimulado.builder().id(8L).respostas(new ArrayList<>()).build();

        Questao q1 = criarQuestao(1L, "A", TipoQuestao.MULTIPLA_ESCOLHA, false);
        Questao q2 = criarQuestao(2L, "B", TipoQuestao.MULTIPLA_ESCOLHA, false);

        criarResposta(tentativa, q1, "A"); // Acerto (+1)
        criarResposta(tentativa, q2, "D"); // Erro em múltipla escolha (0.00, sem penalidade)

        ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);

        assertThat(resultado.totalAcertos()).isEqualTo(1);
        assertThat(resultado.totalErros()).isEqualTo(1);
        assertThat(resultado.pontuacaoLiquida()).isEqualByComparingTo("1.00");
        assertThat(tentativa.getRespostas().get(1).getPontosAtribuidos()).isEqualByComparingTo("0.00");
    }

    @Test
    @DisplayName("Cenário 9: Validação - Lança exceção quando tentativa for nula")
    void deveLancarExcecaoQuandoTentativaForNula() {
        assertThatThrownBy(() -> motorCorrecao.processarCorrecao(null))
                .isInstanceOf(NullPointerException.class)
                .hasMessageContaining("A tentativa de simulado nao pode ser nula");
    }
}
