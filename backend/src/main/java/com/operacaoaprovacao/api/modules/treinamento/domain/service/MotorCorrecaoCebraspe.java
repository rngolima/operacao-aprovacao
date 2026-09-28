package com.operacaoaprovacao.api.modules.treinamento.domain.service;

import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ItemSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.RespostaTentativa;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.TentativaSimulado;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * Motor Matematico de Dominio responsavel pela correcao de tentativas de simulado
 * com base na metodologia oficial da banca Cebraspe (Cespe/UnB).
 *
 * Regras Inviolaveis do Cebraspe:
 * 1. Para questoes do tipo CERTO_ERRADO:
 *    - Acerto: soma o peso do item (+1.00 por padrao).
 *    - Erro: penalidade estrita com deducao do peso (-1.00 por padrao). Ou seja: "Uma errada anula uma certa".
 *    - Abstenção (Em Branco): 0.00 ponto (nao pontua e nao penaliza).
 * 2. Para questoes anuladas pela banca oficial:
 *    - O ponto do item (+peso) e concedido a TODOS os candidatos, independentemente da resposta marcada
 *      ou de ter deixado em branco.
 * 3. Para questoes do tipo MULTIPLA_ESCOLHA:
 *    - Acerto: soma o peso do item (+1.00 por padrao).
 *    - Erro: 0.00 ponto (nao penaliza, salvo regra especifica em edital).
 *    - Abstenção: 0.00 ponto.
 *    - Anulada: concede o peso a todos.
 * 4. Pontuacao Liquida Final:
 *    - Calculada com precisao estrita de BigDecimal (escala de 2 casas decimais e RoundingMode.HALF_UP).
 *    - Pode resultar em nota negativa caso os erros superem os acertos.
 */
@Slf4j
@Service
public class MotorCorrecaoCebraspe {

    public static final BigDecimal PESO_PADRAO = BigDecimal.valueOf(1.00).setScale(2, RoundingMode.HALF_UP);

    /**
     * Processa a correcao completa de uma tentativa de simulado, atribuindo pontos a cada resposta,
     * totalizando os contadores estatisticos e definindo a pontuacao liquida final.
     *
     * @param tentativa Tentativa de simulado contendo as respostas do aluno
     * @return Sumario estatistico imutavel {@link ResultadoCorrecaoCebraspe}
     */
    public ResultadoCorrecaoCebraspe processarCorrecao(TentativaSimulado tentativa) {
        Objects.requireNonNull(tentativa, "A tentativa de simulado nao pode ser nula para correcao.");

        log.info("Iniciando correcao Cebraspe para Tentativa ID: {}", tentativa.getId());

        // 1. Extrair mapa de pesos dos itens do simulado (questaoId -> peso)
        Map<Long, BigDecimal> pesosPorQuestao = extrairMapaDePesos(tentativa);

        BigDecimal pontuacaoLiquida = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_UP);
        int totalAcertos = 0;
        int totalErros = 0;
        int totalEmBranco = 0;
        int totalAnuladas = 0;

        for (RespostaTentativa resposta : tentativa.getRespostas()) {
            Questao questao = resposta.getQuestao();
            if (questao == null) {
                log.warn("Resposta ID: {} sem questao associada. Ignorando no calculo.", resposta.getId());
                continue;
            }

            BigDecimal peso = pesosPorQuestao.getOrDefault(questao.getId(), PESO_PADRAO);

            // REGRA 1: Questao Anulada pela Banca
            if (questao.isAnulada()) {
                totalAnuladas++;
                resposta.setCorreta(true); // Anulada bonifica o candidato
                resposta.setPontosAtribuidos(peso);
                pontuacaoLiquida = pontuacaoLiquida.add(peso);
                log.debug("Questao ID: {} ANULADA. Bonificando com +{}", questao.getId(), peso);
                continue;
            }

            // REGRA 2: Abstenção Estratégica (Em Branco)
            if (resposta.isEmBranco()) {
                totalEmBranco++;
                resposta.setCorreta(null); // Nem acerto, nem erro
                BigDecimal zeroPontos = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_UP);
                resposta.setPontosAtribuidos(zeroPontos);
                log.debug("Questao ID: {} EM BRANCO. Pontos: 0.00", questao.getId());
                continue;
            }

            // REGRA 3: Comparação com o Gabarito Oficial
            boolean acertou = resposta.getRespostaMarcada().trim()
                    .equalsIgnoreCase(questao.getGabaritoOficial().trim());

            if (acertou) {
                totalAcertos++;
                resposta.setCorreta(true);
                resposta.setPontosAtribuidos(peso);
                pontuacaoLiquida = pontuacaoLiquida.add(peso);
                log.debug("Questao ID: {} ACERTO. Pontos: +{}", questao.getId(), peso);
            } else {
                totalErros++;
                resposta.setCorreta(false);

                if (questao.isCertoErrado()) {
                    // REGRA DE OURO CEBRASPE: 1 Errada Anula 1 Certa
                    BigDecimal penalidade = peso.negate();
                    resposta.setPontosAtribuidos(penalidade);
                    pontuacaoLiquida = pontuacaoLiquida.subtract(peso);
                    log.debug("Questao ID: {} ERRO (Cebraspe C/E). Penalidade: -{}", questao.getId(), peso);
                } else {
                    // Questao Multipla Escolha convencional: erro nao pontua nem deduz
                    BigDecimal zeroPontos = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_UP);
                    resposta.setPontosAtribuidos(zeroPontos);
                    log.debug("Questao ID: {} ERRO (Multipla Escolha). Pontos: 0.00", questao.getId());
                }
            }
        }

        // Normalizacao da pontuacao liquida final
        BigDecimal pontuacaoFinal = pontuacaoLiquida.setScale(2, RoundingMode.HALF_UP);

        // Atualizar estado da entidade de dominio TentativaSimulado
        tentativa.setPontuacaoLiquida(pontuacaoFinal);
        tentativa.setTotalAcertos(totalAcertos);
        tentativa.setTotalErros(totalErros);
        tentativa.setTotalEmBranco(totalEmBranco);
        tentativa.setTotalAnuladas(totalAnuladas);

        int totalQuestoes = tentativa.getRespostas().size();

        ResultadoCorrecaoCebraspe resultado = new ResultadoCorrecaoCebraspe(
                pontuacaoFinal,
                totalAcertos,
                totalErros,
                totalEmBranco,
                totalAnuladas,
                totalQuestoes
        );

        log.info("Correcao concluida para Tentativa ID: {}. Nota Liquida: {}, Acertos: {}, Erros: {}, Branco: {}, Anuladas: {}",
                tentativa.getId(), pontuacaoFinal, totalAcertos, totalErros, totalEmBranco, totalAnuladas);

        return resultado;
    }

    private Map<Long, BigDecimal> extrairMapaDePesos(TentativaSimulado tentativa) {
        if (tentativa.getSimulado() == null || tentativa.getSimulado().getItens() == null) {
            return Collections.emptyMap();
        }
        return tentativa.getSimulado().getItens().stream()
                .filter(item -> item.getQuestao() != null && item.getQuestao().getId() != null)
                .collect(Collectors.toMap(
                        item -> item.getQuestao().getId(),
                        ItemSimulado::getPeso,
                        (pesoExistente, pesoNovo) -> pesoExistente
                ));
    }
}
