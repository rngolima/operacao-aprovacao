package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.StatusTentativa;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.TentativaSimulado;
import lombok.Builder;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * DTO que retorna o relatorio analitico completo de desempenho de uma tentativa de simulado,
 * contendo as estatisticas consolidadas Cebraspe e a lista de respostas detalhadas com telemetria.
 */
@Builder
public record ResultadoTentativaDetalhadoDTO(
        Long id,
        Long simuladoId,
        String simuladoTitulo,
        StatusTentativa status,
        LocalDateTime dataInicio,
        LocalDateTime dataFim,
        Integer tempoTotalSegundos,
        BigDecimal pontuacaoLiquida,
        Integer totalAcertos,
        Integer totalErros,
        Integer totalEmBranco,
        Integer totalAnuladas,
        Integer totalQuestoes,
        List<RespostaDetalhadaDTO> itens
) {
    public static ResultadoTentativaDetalhadoDTO fromEntity(TentativaSimulado t) {
        int questoesCount = (t.getSimulado() != null && t.getSimulado().getTotalQuestoes() != null)
                ? t.getSimulado().getTotalQuestoes()
                : (t.getRespostas() != null ? t.getRespostas().size() : 0);

        return ResultadoTentativaDetalhadoDTO.builder()
                .id(t.getId())
                .simuladoId(t.getSimulado() != null ? t.getSimulado().getId() : null)
                .simuladoTitulo(t.getSimulado() != null ? t.getSimulado().getTitulo() : null)
                .status(t.getStatus())
                .dataInicio(t.getDataInicio())
                .dataFim(t.getDataFim())
                .tempoTotalSegundos(t.getTempoTotalSegundos())
                .pontuacaoLiquida(t.getPontuacaoLiquida())
                .totalAcertos(t.getTotalAcertos())
                .totalErros(t.getTotalErros())
                .totalEmBranco(t.getTotalEmBranco())
                .totalAnuladas(t.getTotalAnuladas())
                .totalQuestoes(questoesCount)
                .itens(t.getRespostas() != null
                        ? t.getRespostas().stream().map(RespostaDetalhadaDTO::fromEntity).toList()
                        : List.of())
                .build();
    }
}
