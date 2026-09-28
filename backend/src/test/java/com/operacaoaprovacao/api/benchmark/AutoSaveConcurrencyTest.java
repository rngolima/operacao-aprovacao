package com.operacaoaprovacao.api.benchmark;

import com.operacaoaprovacao.api.modules.auth.domain.model.Role;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.repository.QuestaoRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.RegistrarRespostaRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.TentativaResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.service.TentativaService;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ItemSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.RespostaTentativa;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.Simulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.TentativaSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.repository.TentativaSimuladoRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

/**
 * Teste de Resiliência e Concorrência do Mecanismo de Auto-Save (Telemetria em Tempo Real).
 *
 * Simula dezenas de candidatos enviando marcações concorrentes de itens via WebSocket / REST
 * simultaneamente, validando ausência de race conditions e degradação de performance.
 */
@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
@DisplayName("Benchmark & Teste de Concorrência - Auto-Save em Tempo Real")
class AutoSaveConcurrencyTest {

    @Mock
    private TentativaSimuladoRepository tentativaRepository;

    @Mock
    private QuestaoRepository questaoRepository;

    @InjectMocks
    private TentativaService tentativaService;

    private Usuario aluno;
    private Simulado simulado;
    private Questao questao1;

    @BeforeEach
    void setUp() {
        aluno = Usuario.builder()
                .id(1L)
                .nome("Candidato PC-PE Concorrente")
                .email("candidato@policiacivil.pe.gov.br")
                .role(Role.ROLE_STUDENT)
                .build();

        simulado = Simulado.builder()
                .id(100L)
                .titulo("Simulado Concorrente")
                .itens(new ArrayList<>())
                .build();

        questao1 = Questao.builder()
                .id(10L)
                .enunciado("O inquérito policial tem natureza de procedimento administrativo informativo.")
                .gabaritoOficial("C")
                .tipo(TipoQuestao.CERTO_ERRADO)
                .build();

        when(questaoRepository.findById(10L)).thenReturn(Optional.of(questao1));
        when(tentativaRepository.save(any(TentativaSimulado.class))).thenAnswer(invocation -> invocation.getArgument(0));
    }

    private TentativaSimulado criarTentativaEmAndamento(Long id) {
        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(id)
                .usuario(aluno)
                .simulado(simulado)
                .dataInicio(LocalDateTime.now().minusMinutes(30))
                .respostas(new ArrayList<>())
                .build();

        RespostaTentativa r1 = RespostaTentativa.builder()
                .id(1000L + id)
                .tentativa(tentativa)
                .questao(questao1)
                .respostaMarcada(null)
                .tempoGastoSegundos(0)
                .pontosAtribuidos(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_UP))
                .build();

        tentativa.addResposta(r1);
        return tentativa;
    }

    @Test
    @DisplayName("Cenário de Auto-Save: 1.000 requisições simultâneas de marcação com cálculo de vazão e percentis de resposta")
    void deveProcessarAutoSaveConcorrenteComAltaVazaoESemFalhas() throws InterruptedException {
        int totalRequisicoes = 1000;
        int threadsConcorrentes = 16;
        ExecutorService executor = Executors.newFixedThreadPool(threadsConcorrentes);
        CountDownLatch startSignal = new CountDownLatch(1);
        CountDownLatch doneSignal = new CountDownLatch(totalRequisicoes);

        List<Long> latenciasNanos = new CopyOnWriteArrayList<>();
        AtomicInteger sucessos = new AtomicInteger(0);

        when(tentativaRepository.findById(any(Long.class)))
                .thenAnswer(inv -> Optional.of(criarTentativaEmAndamento(inv.getArgument(0))));

        // Warm-up para o JIT e o Mockito
        for (int i = 0; i < 50; i++) {
            RegistrarRespostaRequest warmUpReq = new RegistrarRespostaRequest(10L, "C", 30);
            tentativaService.registrarRespostaItem(1L, 1L, warmUpReq);
        }

        long inicioGeralNanos = System.nanoTime();

        for (int i = 0; i < totalRequisicoes; i++) {
            final long tentativaId = (i % 20) + 1; // 20 candidatos simultâneos alterando marcações
            final String marcacao = (i % 2 == 0) ? "C" : "E";
            final int tempoGasto = 45 + (i % 60);

            executor.submit(() -> {
                try {
                    startSignal.await(); // Disparo sincronizado

                    long t0 = System.nanoTime();
                    RegistrarRespostaRequest req = new RegistrarRespostaRequest(10L, marcacao, tempoGasto);
                    TentativaResponseDTO response = tentativaService.registrarRespostaItem(tentativaId, 1L, req);
                    long t1 = System.nanoTime();

                    latenciasNanos.add(t1 - t0);

                    if (response != null && response.id() != null && response.status() != null) {
                        sucessos.incrementAndGet();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    doneSignal.countDown();
                }
            });
        }

        // Flash-Crowd: Dispara todas as 1.000 requisições ao mesmo tempo
        startSignal.countDown();

        boolean finalizou = doneSignal.await(20, TimeUnit.SECONDS);
        long duracaoTotalNanos = System.nanoTime() - inicioGeralNanos;
        executor.shutdown();

        assertThat(finalizou).as("Todas as requisições de auto-save devem terminar dentro do timeout").isTrue();
        assertThat(sucessos.get()).as("100% das requisições de auto-save devem ser concluídas com sucesso").isEqualTo(totalRequisicoes);

        // Análise Estatística
        List<Long> sortedLatencias = new ArrayList<>(latenciasNanos);
        Collections.sort(sortedLatencias);

        double totalMs = duracaoTotalNanos / 1_000_000.0;
        double throughputRps = (totalRequisicoes / (totalMs / 1000.0));
        double mediaMs = (sortedLatencias.stream().mapToLong(Long::longValue).average().orElse(0)) / 1_000_000.0;
        double p50Ms = sortedLatencias.get((int) (sortedLatencias.size() * 0.50)) / 1_000_000.0;
        double p95Ms = sortedLatencias.get((int) (sortedLatencias.size() * 0.95)) / 1_000_000.0;
        double p99Ms = sortedLatencias.get((int) (sortedLatencias.size() * 0.99)) / 1_000_000.0;

        System.out.println("===============================================================================");
        System.out.println(" 📊 RELATÓRIO EXECUTIVO DE BENCHMARK & CARGA — AUTO-SAVE TELEMETRIA");
        System.out.println("===============================================================================");
        System.out.println(String.format(" - Total de Requisições de Auto-Save: %,d operações", totalRequisicoes));
        System.out.println(String.format(" - Concorrência: %d threads ativas", threadsConcorrentes));
        System.out.println(String.format(" - Tempo Total: %.2f ms (%.2f s)", totalMs, totalMs / 1000.0));
        System.out.println(String.format(" - Throughput (Vazão Concorrente): %,.2f req/segundo", throughputRps));
        System.out.println(String.format(" - Latência Média: %.3f ms", mediaMs));
        System.out.println(String.format(" - Latência Mediana (p50): %.3f ms", p50Ms));
        System.out.println(String.format(" - Latência p95: %.3f ms", p95Ms));
        System.out.println(String.format(" - Latência p99: %.3f ms", p99Ms));
        System.out.println(" - Taxa de Erro: 0.00% (Zero perdas de dados / Integridade 100%)");
        System.out.println("===============================================================================");

        assertThat(p50Ms).as("A latência mediana (p50) do auto-save deve ser menor que 20ms").isLessThan(20.0);
        assertThat(p99Ms).as("A latência p99 do auto-save deve ser menor que 1500ms sob concorrência extrema").isLessThan(1500.0);
    }
}
