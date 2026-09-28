package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

/**
 * DTO que trafega a requisicao de criacao de um novo caderno de simulado.
 */
public record CriarSimuladoRequest(
        @NotBlank(message = "O titulo do simulado e obrigatorio.")
        @Size(max = 150, message = "O titulo deve ter no maximo 150 caracteres.")
        String titulo,

        String descricao,

        Long concursoId,

        @NotNull(message = "O modo do simulado e obrigatorio.")
        ModoSimulado modo,

        @NotNull(message = "O tempo limite em minutos e obrigatorio.")
        @Min(value = 1, message = "O tempo limite deve ser de pelo menos 1 minuto.")
        Integer tempoLimiteMinutos,

        @NotNull(message = "A lista de itens do simulado e obrigatoria.")
        @Size(min = 1, message = "O simulado deve conter pelo menos 1 questao.")
        @Valid
        List<ItemSimuladoRequest> itens
) {}
