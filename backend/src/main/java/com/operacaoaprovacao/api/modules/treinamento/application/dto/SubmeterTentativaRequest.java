package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import jakarta.validation.Valid;

import java.util.List;

/**
 * DTO para submissao final de uma tentativa de simulado contendo todas as respostas marcadas pelo candidato.
 */
public record SubmeterTentativaRequest(
        @Valid
        List<RegistrarRespostaRequest> respostas
) {}
