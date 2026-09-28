package com.operacaoaprovacao.api.modules.treinamento.application.dto;

import com.operacaoaprovacao.api.modules.treinamento.domain.model.RespostaTentativa;
import lombok.Builder;

import java.math.BigDecimal;

/**
 * DTO que detalha o resultado individual de uma questao respondida na tentativa,
 * com gabarito oficial, explicacao pedagogica e pontuacao obtida.
 */
@Builder
public record RespostaDetalhadaDTO(
        Long questaoId,
        String enunciado,
        String disciplinaNome,
        String assuntoNome,
        String gabaritoOficial,
        String respostaMarcada,
        Boolean correta,
        BigDecimal pontosAtribuidos,
        Integer tempoGastoSegundos,
        boolean questaoAnulada,
        String justificativa,
        String fundamentacaoLegal
) {
    public static RespostaDetalhadaDTO fromEntity(RespostaTentativa r) {
        var q = r.getQuestao();
        return RespostaDetalhadaDTO.builder()
                .questaoId(q != null ? q.getId() : null)
                .enunciado(q != null ? q.getEnunciado() : null)
                .disciplinaNome(q != null && q.getDisciplina() != null ? q.getDisciplina().getNome() : null)
                .assuntoNome(q != null && q.getAssunto() != null ? q.getAssunto().getNome() : null)
                .gabaritoOficial(q != null ? q.getGabaritoOficial() : null)
                .respostaMarcada(r.getRespostaMarcada())
                .correta(r.getCorreta())
                .pontosAtribuidos(r.getPontosAtribuidos())
                .tempoGastoSegundos(r.getTempoGastoSegundos())
                .questaoAnulada(q != null && q.isAnulada())
                .justificativa(q != null ? q.getJustificativa() : null)
                .fundamentacaoLegal(q != null ? q.getFundamentacaoLegal() : null)
                .build();
    }
}
