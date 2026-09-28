package com.operacaoaprovacao.api.modules.certame.application.dto;

import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.StatusConcurso;
import lombok.Builder;

/**
 * DTO imutavel que representa um Concurso Publico para o frontend/mobile.
 */
@Builder
public record ConcursoResponse(
        Long id,
        Long bancaId,
        String bancaSigla,
        String orgao,
        String estado,
        Integer ano,
        StatusConcurso status
) {
    public static ConcursoResponse fromEntity(Concurso c) {
        return ConcursoResponse.builder()
                .id(c.getId())
                .bancaId(c.getBanca() != null ? c.getBanca().getId() : null)
                .bancaSigla(c.getBanca() != null ? c.getBanca().getSigla() : null)
                .orgao(c.getOrgao())
                .estado(c.getEstado())
                .ano(c.getAno())
                .status(c.getStatus())
                .build();
    }
}
