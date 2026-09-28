package com.operacaoaprovacao.api.modules.questao.application.dto;

import com.operacaoaprovacao.api.modules.questao.domain.model.Alternativa;
import lombok.Builder;

/**
 * DTO imutável que representa uma alternativa para o frontend/mobile.
 */
@Builder
public record AlternativaDTO(
        Long id,
        String letra,
        String texto,
        boolean correta,
        String explicacao
) {
    public static AlternativaDTO fromEntity(Alternativa alt) {
        return AlternativaDTO.builder()
                .id(alt.getId())
                .letra(alt.getLetra())
                .texto(alt.getTexto())
                .correta(alt.isCorreta())
                .explicacao(alt.getExplicacao())
                .build();
    }
}
