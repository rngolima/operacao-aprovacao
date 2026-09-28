package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.Simulado;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.List;

/**
 * DTO que trafega as informacoes completas de um Simulado para o cliente da API.
 */
@Builder
public record SimuladoResponseDTO(
        Long id,
        String titulo,
        String descricao,
        Long concursoId,
        String concursoOrgao,
        ModoSimulado modo,
        Integer tempoLimiteMinutos,
        Integer totalQuestoes,
        LocalDateTime createdAt,
        List<ItemSimuladoResponseDTO> itens
) {
    public static SimuladoResponseDTO fromEntity(Simulado s) {
        return SimuladoResponseDTO.builder()
                .id(s.getId())
                .titulo(s.getTitulo())
                .descricao(s.getDescricao())
                .concursoId(s.getConcurso() != null ? s.getConcurso().getId() : null)
                .concursoOrgao(s.getConcurso() != null ? s.getConcurso().getOrgao() : null)
                .modo(s.getModo())
                .tempoLimiteMinutos(s.getTempoLimiteMinutos())
                .totalQuestoes(s.getTotalQuestoes())
                .createdAt(s.getCreatedAt())
                .itens(s.getItens() != null
                        ? s.getItens().stream().map(ItemSimuladoResponseDTO::fromEntity).toList()
                        : List.of())
                .build();
    }
}
