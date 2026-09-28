package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.math.BigDecimal;

/**
 * DTO que representa o pedido de inclusao de uma questao especifica dentro de um simulado.
 */
public record ItemSimuladoRequest(
        @NotNull(message = "O ID da questao e obrigatorio.")
        Long questaoId,

        @NotNull(message = "O numero ordinal da questao e obrigatorio.")
        @Positive(message = "O numero da questao deve ser positivo.")
        Integer numeroQuestao,

        BigDecimal peso
) {}
