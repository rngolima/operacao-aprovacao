package com.operacaoaprovacao.api.modules.questao;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.core.exception.ResourceNotFoundException;
import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import com.operacaoaprovacao.api.modules.certame.domain.repository.AssuntoRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.BancaRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.ConcursoRepository;
import com.operacaoaprovacao.api.modules.certame.domain.repository.DisciplinaRepository;
import com.operacaoaprovacao.api.modules.questao.application.dto.CriarQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.FiltroQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.QuestaoResponse;
import com.operacaoaprovacao.api.modules.questao.application.service.QuestaoService;
import com.operacaoaprovacao.api.modules.questao.domain.model.DificuldadeQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Testes Unitarios para o QuestaoService utilizando Mockito puro.
 * Valida o comportamento da camada de servico em isolamento completo.
 */
@ExtendWith(MockitoExtension.class)
class QuestaoServiceTest {

    @Mock
    private QuestaoRepository questaoRepository;

    @Mock
    private BancaRepository bancaRepository;

    @Mock
    private ConcursoRepository concursoRepository;

    @Mock
    private DisciplinaRepository disciplinaRepository;

    @Mock
    private AssuntoRepository assuntoRepository;

    @InjectMocks
    private QuestaoService questaoService;

    private Banca bancaCebraspe;
    private Disciplina dirPenal;
    private Assunto inquerito;
    private Concurso concursoPcpe;
    private Questao questaoMock;

    @BeforeEach
    void setUp() {
        bancaCebraspe = Banca.builder().id(1L).nome("Cebraspe").sigla("CEBRASPE").build();
        dirPenal = Disciplina.builder().id(10L).nome("Direito Penal").codigo("DIR_PEN").build();
        inquerito = Assunto.builder().id(100L).nome("Inquerito Policial").disciplina(dirPenal).build();
        concursoPcpe = Concurso.builder().id(50L).banca(bancaCebraspe).orgao("Policia Civil de Pernambuco").estado("PE").ano(2024).build();

        questaoMock = Questao.builder()
                .id(1L)
                .banca(bancaCebraspe)
                .concurso(concursoPcpe)
                .disciplina(dirPenal)
                .assunto(inquerito)
                .enunciado("O inquerito policial possui carater inquisitivo.")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .dificuldade(DificuldadeQuestao.FACIL)
                .ano(2024)
                .gabaritoOficial("C")
                .anulada(false)
                .build();
    }

    @Test
    @DisplayName("Deve buscar questao por ID com sucesso e retornar DTO mapeado")
    void deveBuscarPorIdComSucesso() {
        when(questaoRepository.findById(1L)).thenReturn(Optional.of(questaoMock));

        QuestaoResponse response = questaoService.buscarPorId(1L);

        assertThat(response).isNotNull();
        assertThat(response.id()).isEqualTo(1L);
        assertThat(response.bancaSigla()).isEqualTo("CEBRASPE");
        assertThat(response.disciplinaNome()).isEqualTo("Direito Penal");
        assertThat(response.gabaritoOficial()).isEqualTo("C");
        verify(questaoRepository, times(1)).findById(1L);
    }

    @Test
    @DisplayName("Deve lancar ResourceNotFoundException quando questao nao for encontrada")
    void deveLancarExcecaoQuandoQuestaoNaoExiste() {
        when(questaoRepository.findById(999L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> questaoService.buscarPorId(999L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("Questao nao encontrada com id: 999");
    }

    @Test
    @DisplayName("Deve listar questoes com filtros e paginacao via Pageable")
    void deveListarComFiltrosEPaginacao() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Questao> paginaQuestoes = new PageImpl<>(List.of(questaoMock), pageable, 1);
        FiltroQuestaoRequest filtro = FiltroQuestaoRequest.builder()
                .disciplinaId(10L)
                .tipo(TipoQuestao.CERTO_ERRADO)
                .build();

        when(questaoRepository.findComFiltros(10L, null, null, null, TipoQuestao.CERTO_ERRADO, pageable))
                .thenReturn(paginaQuestoes);

        Page<QuestaoResponse> resultado = questaoService.listarComFiltros(filtro, pageable);

        assertThat(resultado).isNotNull();
        assertThat(resultado.getTotalElements()).isEqualTo(1);
        assertThat(resultado.getContent().get(0).enunciado()).contains("inquerito policial");
        verify(questaoRepository, times(1))
                .findComFiltros(10L, null, null, null, TipoQuestao.CERTO_ERRADO, pageable);
    }

    @Test
    @DisplayName("Deve criar questao no modelo Certo/Errado com sucesso")
    void deveCriarQuestaoCertoErradoComSucesso() {
        CriarQuestaoRequest request = CriarQuestaoRequest.builder()
                .bancaId(1L)
                .concursoId(50L)
                .disciplinaId(10L)
                .assuntoId(100L)
                .enunciado("A confissao no inquerito e irretratavel.")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .dificuldade(DificuldadeQuestao.MEDIA)
                .ano(2024)
                .gabaritoOficial("E")
                .build();

        when(bancaRepository.findById(1L)).thenReturn(Optional.of(bancaCebraspe));
        when(disciplinaRepository.findById(10L)).thenReturn(Optional.of(dirPenal));
        when(assuntoRepository.findById(100L)).thenReturn(Optional.of(inquerito));
        when(concursoRepository.findById(50L)).thenReturn(Optional.of(concursoPcpe));
        when(questaoRepository.save(any(Questao.class))).thenAnswer(invocation -> {
            Questao q = invocation.getArgument(0);
            q.setId(200L);
            return q;
        });

        QuestaoResponse response = questaoService.criarQuestao(request);

        assertThat(response).isNotNull();
        assertThat(response.id()).isEqualTo(200L);
        assertThat(response.gabaritoOficial()).isEqualTo("E");
        assertThat(response.tipo()).isEqualTo(TipoQuestao.CERTO_ERRADO);
        verify(questaoRepository, times(1)).save(any(Questao.class));
    }

    @Test
    @DisplayName("Deve lancar BusinessException quando assunto nao pertence a disciplina informada")
    void deveLancarExcecaoQuandoAssuntoNaoPertenceADisciplina() {
        Disciplina dirConst = Disciplina.builder().id(99L).nome("Direito Constitucional").build();
        // Inquerito pertence a dirPenal (id 10L), mas passamos disciplinaId 99L
        CriarQuestaoRequest request = CriarQuestaoRequest.builder()
                .bancaId(1L)
                .disciplinaId(99L)
                .assuntoId(100L)
                .enunciado("Enunciado de teste")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .dificuldade(DificuldadeQuestao.FACIL)
                .ano(2024)
                .gabaritoOficial("C")
                .build();

        when(bancaRepository.findById(1L)).thenReturn(Optional.of(bancaCebraspe));
        when(disciplinaRepository.findById(99L)).thenReturn(Optional.of(dirConst));
        when(assuntoRepository.findById(100L)).thenReturn(Optional.of(inquerito));

        assertThatThrownBy(() -> questaoService.criarQuestao(request))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("nao pertence a disciplina");

        verify(questaoRepository, never()).save(any());
    }

    @Test
    @DisplayName("Deve criar questao no modelo Multipla Escolha com alternativas vinculadas")
    void deveCriarQuestaoMultiplaEscolhaComSucesso() {
        CriarQuestaoRequest.CriarAlternativaRequest altA = CriarQuestaoRequest.CriarAlternativaRequest.builder()
                .letra("A").texto("Alternativa A incorreta").correta(false).build();
        CriarQuestaoRequest.CriarAlternativaRequest altB = CriarQuestaoRequest.CriarAlternativaRequest.builder()
                .letra("B").texto("Alternativa B correta").correta(true).build();

        CriarQuestaoRequest request = CriarQuestaoRequest.builder()
                .bancaId(1L)
                .disciplinaId(10L)
                .assuntoId(100L)
                .enunciado("Qual das alternativas representa caracteristica do inquerito?")
                .tipo(TipoQuestao.MULTIPLA_ESCOLHA)
                .dificuldade(DificuldadeQuestao.MEDIA)
                .ano(2024)
                .gabaritoOficial("B")
                .alternativas(List.of(altA, altB))
                .build();

        when(bancaRepository.findById(1L)).thenReturn(Optional.of(bancaCebraspe));
        when(disciplinaRepository.findById(10L)).thenReturn(Optional.of(dirPenal));
        when(assuntoRepository.findById(100L)).thenReturn(Optional.of(inquerito));
        when(questaoRepository.save(any(Questao.class))).thenAnswer(invocation -> {
            Questao q = invocation.getArgument(0);
            q.setId(300L);
            return q;
        });

        QuestaoResponse response = questaoService.criarQuestao(request);

        assertThat(response).isNotNull();
        assertThat(response.id()).isEqualTo(300L);
        assertThat(response.alternativas()).hasSize(2);
        verify(questaoRepository, times(1)).save(any(Questao.class));
    }

    @Test
    @DisplayName("Deve rejeitar questao de multipla escolha sem nenhuma alternativa correta")
    void deveRejeitarMultiplaEscolhaSemAlternativaCorreta() {
        CriarQuestaoRequest.CriarAlternativaRequest altA = CriarQuestaoRequest.CriarAlternativaRequest.builder()
                .letra("A").texto("Texto A").correta(false).build();
        CriarQuestaoRequest.CriarAlternativaRequest altB = CriarQuestaoRequest.CriarAlternativaRequest.builder()
                .letra("B").texto("Texto B").correta(false).build();

        CriarQuestaoRequest request = CriarQuestaoRequest.builder()
                .bancaId(1L)
                .disciplinaId(10L)
                .assuntoId(100L)
                .enunciado("Questao invalida")
                .tipo(TipoQuestao.MULTIPLA_ESCOLHA)
                .dificuldade(DificuldadeQuestao.MEDIA)
                .ano(2024)
                .gabaritoOficial("A")
                .alternativas(List.of(altA, altB))
                .build();

        when(bancaRepository.findById(1L)).thenReturn(Optional.of(bancaCebraspe));
        when(disciplinaRepository.findById(10L)).thenReturn(Optional.of(dirPenal));
        when(assuntoRepository.findById(100L)).thenReturn(Optional.of(inquerito));

        assertThatThrownBy(() -> questaoService.criarQuestao(request))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("exatamente uma alternativa correta");

        verify(questaoRepository, never()).save(any());
    }

    @Test
    @DisplayName("Deve anular questao com sucesso, setando flag e gabarito oficial como ANULADA")
    void deveAnularQuestaoComSucesso() {
        when(questaoRepository.findById(1L)).thenReturn(Optional.of(questaoMock));
        when(questaoRepository.save(any(Questao.class))).thenAnswer(invocation -> invocation.getArgument(0));

        QuestaoResponse response = questaoService.anularQuestao(1L);

        assertThat(response.anulada()).isTrue();
        assertThat(response.gabaritoOficial()).isEqualTo("ANULADA");
        verify(questaoRepository, times(1)).save(questaoMock);
    }

    @Test
    @DisplayName("Deve lancar BusinessException ao tentar anular questao ja anulada")
    void deveLancarExcecaoAoAnularQuestaoJaAnulada() {
        questaoMock.setAnulada(true);
        when(questaoRepository.findById(1L)).thenReturn(Optional.of(questaoMock));

        assertThatThrownBy(() -> questaoService.anularQuestao(1L))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("A questao já se encontra anulada.");

        verify(questaoRepository, never()).save(any());
    }
}
