package com.operacaoaprovacao.api.modules.questao;

import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import com.operacaoaprovacao.api.modules.questao.domain.model.Alternativa;
import com.operacaoaprovacao.api.modules.questao.domain.model.DificuldadeQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Testes Unitarios corporativos para o Dominio de Questoes (Cebraspe e Multipla Escolha).
 * Executa em milissegundos na JVM sem peso de containers.
 */
class QuestaoDomainTest {

    @Test
    @DisplayName("Deve instanciar questao Certo/Errado no modelo Cebraspe com fundamentacao legal")
    void shouldCreateCertoErradoQuestaoCorrectly() {
        Banca banca = Banca.builder().id(1L).sigla("CEBRASPE").build();
        Disciplina disciplina = Disciplina.builder().id(3L).nome("Direito Processual Penal").build();
        Assunto assunto = Assunto.builder().id(5L).nome("Inquerito Policial").disciplina(disciplina).build();

        Questao questao = Questao.builder()
                .id(100L)
                .banca(banca)
                .disciplina(disciplina)
                .assunto(assunto)
                .enunciado("O inquerito policial e dispensavel para a propositura da acao penal publica.")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .dificuldade(DificuldadeQuestao.MEDIA)
                .ano(2024)
                .anulada(false)
                .gabaritoOficial("CERTO")
                .justificativa("O MP pode propor acao penal se ja tiver elementos suficientes.")
                .fundamentacaoLegal("Art. 39, § 5º e Art. 46, § 1º do CPP.")
                .jurisprudencia("Jurisprudencia pacifica do STJ.")
                .build();

        assertThat(questao.getId()).isEqualTo(100L);
        assertThat(questao.isCertoErrado()).isTrue();
        assertThat(questao.getGabaritoOficial()).isEqualTo("CERTO");
        assertThat(questao.isAnulada()).isFalse();
        assertThat(questao.getFundamentacaoLegal()).contains("CPP");
        assertThat(questao.getBanca().getSigla()).isEqualTo("CEBRASPE");
    }

    @Test
    @DisplayName("Deve adicionar alternativas a questao de Multipla Escolha mantendo a relacao bidirecional")
    void shouldAddAlternativasToMultiplaEscolhaQuestao() {
        Questao questao = Questao.builder()
                .id(200L)
                .tipo(TipoQuestao.MULTIPLA_ESCOLHA)
                .enunciado("Assinale a alternativa que indica a autoridade competente para presidir o IP:")
                .ano(2024)
                .gabaritoOficial("A")
                .build();

        Alternativa altA = Alternativa.builder()
                .letra("A")
                .texto("Delegado de Policia de carreira.")
                .correta(true)
                .explicacao("O Delegado e a autoridade policial competente nos termos da Lei 12.830/2013.")
                .build();

        Alternativa altB = Alternativa.builder()
                .letra("B")
                .texto("Juiz de Direito.")
                .correta(false)
                .explicacao("O juiz exerce funcao jurisdicional, nao preside IP.")
                .build();

        questao.addAlternativa(altA);
        questao.addAlternativa(altB);

        assertThat(questao.isCertoErrado()).isFalse();
        assertThat(questao.getAlternativas()).hasSize(2);
        assertThat(altA.getQuestao()).isEqualTo(questao);
        assertThat(altB.getQuestao()).isEqualTo(questao);
    }

    @Test
    @DisplayName("Deve marcar questao como anulada corretamente")
    void shouldHandleAnuladaQuestao() {
        Questao questao = Questao.builder()
                .id(300L)
                .tipo(TipoQuestao.CERTO_ERRADO)
                .ano(2024)
                .anulada(true)
                .gabaritoOficial("ANULADA")
                .justificativa("Questao anulada pela banca examinadora em razao de vicio material no enunciado.")
                .build();

        assertThat(questao.isAnulada()).isTrue();
        assertThat(questao.getGabaritoOficial()).isEqualTo("ANULADA");
    }
}
