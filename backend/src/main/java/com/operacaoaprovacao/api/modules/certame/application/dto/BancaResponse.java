package com.operacaoaprovacao.api.modules.certame.application.dto;

import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import lombok.Builder;

/**
 * DTO imutavel que representa uma Banca Examinadora para exposicao pela API.
 */
@Builder
public record BancaResponse(
        Long id,
        String nome,
        String sigla,
        String siteOficial
) {
    public static BancaResponse fromEntity(Banca b) {
        return BancaResponse.builder()
                .id(b.getId())
                .nome(b.getNome())
                .sigla(b.getSigla())
                .siteOficial(b.getSiteOficial())
                .build();
    }
}
