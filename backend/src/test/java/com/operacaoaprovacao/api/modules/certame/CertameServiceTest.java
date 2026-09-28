package com.operacaoaprovacao.api.modules.certame;

import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.certame.application.dto.BancaResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.ConcursoResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.DisciplinaTreeResponse;
import com.operacaoaprovacao.api.modules.certame.application.service.CertameService;
import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import com.operacaoaprovacao.api.modules.certame.domain.repository.BancaRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.ConcursoRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.DisciplinaRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.*;

/**
 * Testes Unitarios para o CertameService com Mockito puro.
 */
@ExtendWith(MockitoExtension.class)
class CertameServiceTest {

    @Mock
    private BancaRepository bancaRepository;

    @Mock
    private ConcursoRepository concursoRepository;

    @Mock
    private DisciplinaRepository disciplinaRepository;

    @InjectMocks
    private CertameService certameService;

    private Banca bancaCebraspe;
    private Concurso concursoPcpe;
    private Disciplina disciplina;

    @BeforeEach
    void setUp() {
        bancaCebraspe = Banca.builder().id(1L).nome("Cebraspe").sigla("CEBRASPE").siteOficial("https://cebraspe.org.br").build();
        concursoPcpe = Concurso.builder().id(10L).banca(bancaCebraspe).orgao("PC-PE").estado("PE").ano(2024).build();

        disciplina = Disciplina.builder().id(100L).nome("Direito Constitucional").codigo("DIR_CONST").build();
        Assunto assunto = Assunto.builder().id(500L).nome("Direitos e Garantias Fundamentais").disciplina(disciplina).build();
        disciplina.addAssunto(assunto);
    }

    @Test
    @DisplayName("Deve listar todas as bancas cadastradas")
    void deveListarBancas() {
        when(bancaRepository.findAll()).thenReturn(List.of(bancaCebraspe));

        List<BancaResponse> bancas = certameService.listarBancas();

        assertThat(bancas).hasSize(1);
        assertThat(bancas.get(0).sigla()).isEqualTo("CEBRASPE");
        verify(bancaRepository, times(1)).findAll();
    }

    @Test
    @DisplayName("Deve buscar banca por ID com sucesso")
    void deveBuscarBancaPorId() {
        when(bancaRepository.findById(1L)).thenReturn(Optional.of(bancaCebraspe));

        BancaResponse response = certameService.buscarBancaPorId(1L);

        assertThat(response).isNotNull();
        assertThat(response.id()).isEqualTo(1L);
        assertThat(response.nome()).isEqualTo("Cebraspe");
    }

    @Test
    @DisplayName("Deve lancar ResourceNotFoundException quando banca nao existir")
    void deveLancarExcecaoQuandoBancaNaoExiste() {
        when(bancaRepository.findById(99L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> certameService.buscarBancaPorId(99L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("Banca examinadora nao encontrada");
    }

    @Test
    @DisplayName("Deve listar concursos por estado")
    void deveListarConcursosPorEstado() {
        when(concursoRepository.findByEstado("PE")).thenReturn(List.of(concursoPcpe));

        List<ConcursoResponse> concursos = certameService.listarConcursosPorEstado("PE");

        assertThat(concursos).hasSize(1);
        assertThat(concursos.get(0).orgao()).isEqualTo("PC-PE");
        verify(concursoRepository, times(1)).findByEstado("PE");
    }

    @Test
    @DisplayName("Deve obter arvore de disciplinas com assuntos aninhados")
    void deveObterArvoreDisciplinas() {
        when(disciplinaRepository.findAllWithAssuntos()).thenReturn(List.of(disciplina));

        List<DisciplinaTreeResponse> arvore = certameService.obterArvoreDisciplinas();

        assertThat(arvore).hasSize(1);
        assertThat(arvore.get(0).nome()).isEqualTo("Direito Constitucional");
        assertThat(arvore.get(0).assuntos()).hasSize(1);
        assertThat(arvore.get(0).assuntos().get(0).nome()).isEqualTo("Direitos e Garantias Fundamentais");
        verify(disciplinaRepository, times(1)).findAllWithAssuntos();
    }
}
