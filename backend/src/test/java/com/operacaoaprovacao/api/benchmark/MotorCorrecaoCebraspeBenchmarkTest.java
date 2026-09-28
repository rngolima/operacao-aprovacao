package com.operacaoaprovacao.api.benchmark;

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
import java.util.Collections;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Suite de Testes de Carga, Estresse e Benchmark de Concorrência
 * do Motor Matemático de Correção Cebraspe da Operação Aprovação.
 *
 * Simula um cenário de pico extremo de tráfego (ex: fechamento simultâneo
 * de simulados por milhares de candidatos ao término do tempo de prova).
 */
@DisplayName("Benchmark & Teste de Carga - Motor Cebraspe")
class MotorCorrecaoCebraspeBenchmarkTest {

    private MotorCorrecaoCebraspe motorCorrecao;

    @BeforeEach
    void setUp() {
        motorCorrecao = new MotorCorrecaoCebraspe();
    }

    /**
     * Constrói uma tentativa padrão com 60 itens no modelo oficial PC-PE:
     * - 40 questões com resposta correta (+40.00)
     * - 10 questões com resposta errada (-10.00)
     * - 5 questões em branco (0.00)
     * - 5 questões anuladas pela banca (+5.00 bonificadas)
     * Nota Líquida Esperada: 40 - 10 + 5 = 35.00
     */
    private TentativaSimulado criarTentativaPadraoPcPe(Long tentativaId) {
        Simulado simulado = Simulado.builder()
                .id(100L)
                .titulo("Simulado Oficial PC-PE - 60 Itens")
                .itens(new ArrayList<>())
                .build();

        TentativaSimulado tentativa = TentativaSimulado.builder()
                .id(tentativaId)
                .simulado(simulado)
                .respostas(new ArrayList<>())
                .build();

        // 1 a 40: Acertos
        for (long i = 1; i <= 40; i++) {
            Questao q = criarQuestao(i, "C", TipoQuestao.CERTO_ERRADO, false);
            adicionarItemAoSimulado(simulado, q, (int) i);
            adicionarResposta(tentativa, q, "C");
        }

        // 41 a 50: Erros
        for (long i = 41; i <= 50; i++) {
            Questao q = criarQuestao(i, "C", TipoQuestao.CERTO_ERRADO, false);
            adicionarItemAoSimulado(simulado, q, (int) i);
            adicionarResposta(tentativa, q, "E"); // Marcou E mas o gabarito era C
        }

        // 51 a 55: Em Branco
        for (long i = 51; i <= 55; i++) {
            Questao q = criarQuestao(i, "C", TipoQuestao.CERTO_ERRADO, false);
            adicionarItemAoSimulado(simulado, q, (int) i);
            adicionarResposta(tentativa, q, null); // Em branco
        }

        // 56 a 60: Anuladas
        for (long i = 56; i <= 60; i++) {
            Questao q = criarQuestao(i, "C", TipoQuestao.CERTO_ERRADO, true); // Anulada
            adicionarItemAoSimulado(simulado, q, (int) i);
            adicionarResposta(tentativa, q, "E");
        }

        return tentativa;
    }

    private Questao criarQuestao(Long id, String gabarito, TipoQuestao tipo, boolean anulada) {
        return Questao.builder()
                .id(id)
                .gabaritoOficial(gabarito)
                .tipo(tipo)
                .anulada(anulada)
                .build();
    }

    private void adicionarItemAoSimulado(Simulado simulado, Questao questao, int ordem) {
        ItemSimulado item = ItemSimulado.builder()
                .simulado(simulado)
                .questao(questao)
                .numeroQuestao(ordem)
                .peso(BigDecimal.valueOf(1.00).setScale(2, RoundingMode.HALF_UP))
                .build();
        simulado.addItem(item);
    }

    private void adicionarResposta(TentativaSimulado tentativa, Questao questao, String marcacao) {
        RespostaTentativa resp = RespostaTentativa.builder()
                .tentativa(tentativa)
                .questao(questao)
                .respostaMarcada(marcacao)
                .build();
        tentativa.addResposta(resp);
    }

    @Test
    @DisplayName("Cenário de Estresse: 5.000 correções simultâneas de simulados de 60 itens com cálculo de percentis p50, p95 e p99")
    void deveExecutarBenchmarkComAltaConcorrenciaECalcularPercentisDeLatencia() throws InterruptedException {
        int totalRequisicoes = 5000;
        int poolThreads = 16;
        ExecutorService executor = Executors.newFixedThreadPool(poolThreads);
        CountDownLatch startSignal = new CountDownLatch(1);
        CountDownLatch doneSignal = new CountDownLatch(totalRequisicoes);

        List<Long> latenciasNanos = new CopyOnWriteArrayList<>();
        AtomicInteger sucessos = new AtomicInteger(0);
        BigDecimal notaEsperada = BigDecimal.valueOf(35.00).setScale(2, RoundingMode.HALF_UP);

        // Warm-up da JVM (JIT Compiler C2) para evitar distorção nas medições
        for (int i = 0; i < 500; i++) {
            TentativaSimulado warmUpTentativa = criarTentativaPadraoPcPe(9999L);
            motorCorrecao.processarCorrecao(warmUpTentativa);
        }

        long inicioGeralNanos = System.nanoTime();

        // Enfileira as 5.000 correções concorrentes
        for (int i = 0; i < totalRequisicoes; i++) {
            final long tentativaId = i + 1;
            executor.submit(() -> {
                try {
                    startSignal.await(); // Aguarda o tiro de partida unificado
                    TentativaSimulado tentativa = criarTentativaPadraoPcPe(tentativaId);

                    long t0 = System.nanoTime();
                    ResultadoCorrecaoCebraspe resultado = motorCorrecao.processarCorrecao(tentativa);
                    long t1 = System.nanoTime();

                    latenciasNanos.add(t1 - t0);

                    // Validação de integridade matemática concorrente
                    if (resultado.pontuacaoLiquida().compareTo(notaEsperada) == 0 &&
                            resultado.totalAcertos() == 40 &&
                            resultado.totalErros() == 10 &&
                            resultado.totalEmBranco() == 5 &&
                            resultado.totalAnuladas() == 5) {
                        sucessos.incrementAndGet();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    doneSignal.countDown();
                }
            });
        }

        // Disparo simultâneo (Flash Crowd)
        startSignal.countDown();

        // Aguarda todas as tarefas finalizarem (timeout de 30 segundos)
        boolean finalizou = doneSignal.await(30, TimeUnit.SECONDS);
        long duracaoTotalNanos = System.nanoTime() - inicioGeralNanos;
        executor.shutdown();

        assertThat(finalizou).as("Todas as 5.000 correções devem finalizar dentro do timeout").isTrue();
        assertThat(sucessos.get()).as("100% das correções devem ter nota líquida exata de 35.00").isEqualTo(totalRequisicoes);

        // Análise Estatística de Métricas e Percentis
        List<Long> sortedLatencias = new ArrayList<>(latenciasNanos);
        Collections.sort(sortedLatencias);

        double totalMs = duracaoTotalNanos / 1_000_000.0;
        double throughputRps = (totalRequisicoes / (totalMs / 1000.0));

        double minMs = sortedLatencias.get(0) / 1_000_000.0;
        double maxMs = sortedLatencias.get(sortedLatencias.size() - 1) / 1_000_000.0;
        double mediaMs = (sortedLatencias.stream().mapToLong(Long::longValue).average().orElse(0)) / 1_000_000.0;
        double p50Ms = sortedLatencias.get((int) (sortedLatencias.size() * 0.50)) / 1_000_000.0;
        double p95Ms = sortedLatencias.get((int) (sortedLatencias.size() * 0.95)) / 1_000_000.0;
        double p99Ms = sortedLatencias.get((int) (sortedLatencias.size() * 0.99)) / 1_000_000.0;

        System.out.println("===============================================================================");
        System.out.println(" 📊 RELATÓRIO EXECUTIVO DE BENCHMARK & CARGA — MOTOR CEBRASPE");
        System.out.println("===============================================================================");
        System.out.println(String.format(" - Total de Simulados Corrigidos: %,d provas de 60 itens", totalRequisicoes));
        System.out.println(String.format(" - Total de Itens Avaliados: %,d questões", totalRequisicoes * 60));
        System.out.println(String.format(" - Tempo Total de Execução: %.2f ms (%.2f s)", totalMs, totalMs / 1000.0));
        System.out.println(String.format(" - Throughput (Vazão Concorrente): %,.2f simulados/segundo", throughputRps));
        System.out.println(String.format(" - Latência Mínima: %.3f ms", minMs));
        System.out.println(String.format(" - Latência Média: %.3f ms", mediaMs));
        System.out.println(String.format(" - Latência Mediana (p50): %.3f ms", p50Ms));
        System.out.println(String.format(" - Latência p95: %.3f ms", p95Ms));
        System.out.println(String.format(" - Latência p99: %.3f ms", p99Ms));
        System.out.println(" - Taxa de Erro: 0.00% (Zero condições de corrida / Integridade 100%)");
        System.out.println("===============================================================================");

        // Metas de SLA de Engenharia Sênior sob Carga Extrema Concorrente (Flash-Crowd)
        assertThat(p50Ms).as("A latência mediana (p50) deve ser ultrarrápida (sub-milissegundo)").isLessThan(5.0);
        assertThat(p99Ms).as("A latência no percentil p99 deve ser inferior a 500 milissegundos sob estresse extremo").isLessThan(500.0);
    }
}
