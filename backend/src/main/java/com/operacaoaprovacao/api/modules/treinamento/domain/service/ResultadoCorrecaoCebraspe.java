package com.operacaoaprovacao.api.modules.treinamento.domain.service;

import java.math.BigDecimal;

/**
 * Record imutavel que encapsula o sumario estatistico e matematico
 * gerado pelo Motor de Correcao no padrao Cebraspe.
 */
public record ResultadoCorrecaoCebraspe(
        BigDecimal pontuacaoLiquida,
        int totalAcertos,
        int totalErros,
        int totalEmBranco,
        int totalAnuladas,
        int totalQuestoes
) {
    public static ResultadoCorrecaoCebraspe zerado(int totalQuestoes) {
        return new ResultadoCorrecaoCebraspe(
                BigDecimal.ZERO.setScale(2),
                0,
                0,
                totalQuestoes,
                0,
                totalQuestoes
        );
    }
}
