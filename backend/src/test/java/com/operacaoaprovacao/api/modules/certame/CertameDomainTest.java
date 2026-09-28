package com.operacaoaprovacao.api.modules.certame;

import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.Edital;
import com.operacaoaprovacao.api.modules.certame.domain.model.StatusConcurso;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Testes Unitarios corporativos para o Dominio de Certames (Banca, Concurso, Edital).
 * Executa em milissegundos sem peso de container.
 */
class CertameDomainTest {

    @Test
    @DisplayName("Deve instanciar Banca com atributos corretos via Builder")
    void shouldCreateBancaCorrectly() {
        Banca banca = Banca.builder()
                .id(1L)
                .nome("Centro Brasileiro de Pesquisa em Avaliacao e Selecao")
                .sigla("CEBRASPE")
                .siteOficial("https://www.cebraspe.org.br")
                .build();

        assertThat(banca.getId()).isEqualTo(1L);
        assertThat(banca.getSigla()).isEqualTo("CEBRASPE");
        assertThat(banca.getNome()).contains("Brasileiro");
        assertThat(banca.getSiteOficial()).isEqualTo("https://www.cebraspe.org.br");
    }

    @Test
    @DisplayName("Deve vincular Concurso a uma Banca e definir status padrao PREVISTO")
    void shouldLinkConcursoToBancaWithDefaultStatus() {
        Banca banca = Banca.builder().id(1L).sigla("CEBRASPE").build();

        Concurso concurso = Concurso.builder()
                .id(10L)
                .banca(banca)
                .orgao("Policia Civil do Estado de Pernambuco")
                .estado("PE")
                .ano(2024)
                .status(StatusConcurso.HOMOLOGADO)
                .build();

        assertThat(concurso.getId()).isEqualTo(10L);
        assertThat(concurso.getBanca()).isNotNull();
        assertThat(concurso.getBanca().getSigla()).isEqualTo("CEBRASPE");
        assertThat(concurso.getEstado()).isEqualTo("PE");
        assertThat(concurso.getAno()).isEqualTo(2024);
        assertThat(concurso.getStatus()).isEqualTo(StatusConcurso.HOMOLOGADO);
    }

    @Test
    @DisplayName("Deve vincular Edital a um Concurso com contagem de questoes e vagas")
    void shouldCreateEditalWithConcursoAssociation() {
        Concurso concurso = Concurso.builder()
                .id(10L)
                .orgao("PC-PE")
                .ano(2024)
                .build();

        Edital edital = Edital.builder()
                .id(100L)
                .concurso(concurso)
                .numero("Edital nº 01/2023 - Agente e Escrivao")
                .dataPublicacao(LocalDate.of(2023, 12, 22))
                .totalVagas(445)
                .totalQuestoes(60)
                .linkOficial("https://cebraspe.org.br/concursos/pc_pe_23")
                .build();

        assertThat(edital.getConcurso()).isEqualTo(concurso);
        assertThat(edital.getNumero()).contains("Edital nº 01/2023");
        assertThat(edital.getTotalVagas()).isEqualTo(445);
        assertThat(edital.getTotalQuestoes()).isEqualTo(60);
        assertThat(edital.getDataPublicacao()).isEqualTo(LocalDate.of(2023, 12, 22));
    }
}
