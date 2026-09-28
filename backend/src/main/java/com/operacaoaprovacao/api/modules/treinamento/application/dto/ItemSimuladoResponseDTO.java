package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import com.operacaoaprovacao.api.modules.questao.application.dto.AlternativaDTO;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ItemSimulado;
import lombok.Builder;

import java.math.BigDecimal;
import java.util.List;

/**
 * DTO que representa a visualizacao de uma questao ordenada dentro de um simulado.
 */
@Builder
public record ItemSimuladoResponseDTO(
        Long id,
        Integer numeroQuestao,
        BigDecimal peso,
        Long questaoId,
        String enunciado,
        String textoBase,
        TipoQuestao tipo,
        String disciplinaNome,
        String assuntoNome,
        List<AlternativaDTO> alternativas
) {
    public static ItemSimuladoResponseDTO fromEntity(ItemSimulado item) {
        var q = item.getQuestao();
        return ItemSimuladoResponseDTO.builder()
                .id(item.getId())
                .numeroQuestao(item.getNumeroQuestao())
                .peso(item.getPeso())
                .questaoId(q != null ? q.getId() : null)
                .enunciado(q != null ? q.getEnunciado() : null)
                .textoBase(q != null ? q.getTextoBase() : null)
                .tipo(q != null ? q.getTipo() : null)
                .disciplinaNome(q != null && q.getDisciplina() != null ? q.getDisciplina().getNome() : null)
                .assuntoNome(q != null && q.getAssunto() != null ? q.getAssunto().getNome() : null)
                .alternativas(q != null && q.getAlternativas() != null
                        ? q.getAlternativas().stream().map(AlternativaDTO::fromEntity).toList()
                        : List.of())
                .build();
    }
}
