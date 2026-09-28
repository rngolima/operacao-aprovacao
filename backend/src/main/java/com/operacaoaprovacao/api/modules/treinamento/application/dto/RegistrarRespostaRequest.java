package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;

/**
 * DTO para registro de uma marcacao individual em tempo real com telemetria.
 */
public record RegistrarRespostaRequest(
        @NotNull(message = "O ID da questao e obrigatorio.")
        Long questaoId,

        String respostaMarcada, // "C", "E", "A", ... ou null/vazio se abstenção

        @PositiveOrZero(message = "O tempo gasto em segundos deve ser zero ou positivo.")
        Integer tempoGastoSegundos
) {}
