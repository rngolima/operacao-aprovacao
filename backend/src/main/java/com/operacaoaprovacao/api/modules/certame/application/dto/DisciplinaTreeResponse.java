package com.operacaoaprovacao.api.modules.certame.application.dto;

import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import lombok.Builder;

import java.util.List;

/**
 * DTO hierarquico imutavel que representa a Arvore de Conhecimento (Disciplina com seus Assuntos).
 */
@Builder
public record DisciplinaTreeResponse(
        Long id,
        String nome,
        String codigo,
        List<AssuntoResponse> assuntos
) {
    @Builder
    public record AssuntoResponse(
            Long id,
            String nome
    ) {
        public static AssuntoResponse fromEntity(Assunto a) {
            return AssuntoResponse.builder()
                    .id(a.getId())
                    .nome(a.getNome())
                    .build();
        }
    }

    public static DisciplinaTreeResponse fromEntity(Disciplina d) {
        return DisciplinaTreeResponse.builder()
                .id(d.getId())
                .nome(d.getNome())
                .codigo(d.getCodigo())
                .assuntos(d.getAssuntos() != null
                        ? d.getAssuntos().stream().map(AssuntoResponse::fromEntity).toList()
                        : List.of())
                .build();
    }
}
