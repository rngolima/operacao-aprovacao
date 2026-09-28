package com.operacaoaprovacao.api.modules.certame;

import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Testes Unitarios corporativos para a Arvore de Conhecimento (Disciplina & Assunto).
 * Executa em milissegundos sem peso de container.
 */
class DisciplinaAssuntoDomainTest {

    @Test
    @DisplayName("Deve instanciar Disciplina com atributos corretos via Builder")
    void shouldCreateDisciplinaCorrectly() {
        Disciplina disciplina = Disciplina.builder()
                .id(1L)
                .nome("Direito Processual Penal")
                .codigo("DPPR")
                .build();

        assertThat(disciplina.getId()).isEqualTo(1L);
        assertThat(disciplina.getNome()).isEqualTo("Direito Processual Penal");
        assertThat(disciplina.getCodigo()).isEqualTo("DPPR");
        assertThat(disciplina.getAssuntos()).isEmpty();
    }

    @Test
    @DisplayName("Deve adicionar Assunto a Disciplina mantendo a consistencia bidirecional")
    void shouldAddAssuntoMaintainingBidirectionalRelationship() {
        Disciplina disciplina = Disciplina.builder()
                .id(2L)
                .nome("Direito Penal")
                .codigo("DPEN")
                .build();

        Assunto assunto = Assunto.builder()
                .id(10L)
                .nome("Crimes contra o Patrimonio (Furto, Roubo, Extorsao)")
                .build();

        disciplina.addAssunto(assunto);

        assertThat(disciplina.getAssuntos()).hasSize(1);
        assertThat(disciplina.getAssuntos().get(0)).isEqualTo(assunto);
        assertThat(assunto.getDisciplina()).isEqualTo(disciplina);
    }

    @Test
    @DisplayName("Deve remover Assunto de Disciplina limpando a referencia inversa")
    void shouldRemoveAssuntoCleaningInverseReference() {
        Disciplina disciplina = Disciplina.builder()
                .id(3L)
                .nome("Lingua Portuguesa")
                .codigo("PORT")
                .build();

        Assunto assunto = Assunto.builder()
                .id(20L)
                .nome("Concordancia Verbal e Nominal")
                .build();

        disciplina.addAssunto(assunto);
        assertThat(disciplina.getAssuntos()).hasSize(1);

        disciplina.removeAssunto(assunto);
        assertThat(disciplina.getAssuntos()).isEmpty();
        assertThat(assunto.getDisciplina()).isNull();
    }
}
