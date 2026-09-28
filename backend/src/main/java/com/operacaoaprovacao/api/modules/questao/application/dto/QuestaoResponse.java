package com.operacaoaprovacao.api.modules.questao.application.dto;

import com.operacaoaprovacao.api.modules.questao.domain.model.DificuldadeQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import lombok.Builder;

import java.util.List;

/**
 * DTO imutavel que trafega os dados completos de uma Questao para o cliente da API.
 */
@Builder
public record QuestaoResponse(
        Long id,
        Long bancaId,
        String bancaSigla,
        Long concursoId,
        String concursoOrgao,
        Long disciplinaId,
        String disciplinaNome,
        Long assuntoId,
        String assuntoNome,
        String enunciado,
        String textoBase,
        TipoQuestao tipo,
        DificuldadeQuestao dificuldade,
        Integer ano,
        boolean anulada,
        String gabaritoOficial,
        String justificativa,
        String fundamentacaoLegal,
        String jurisprudencia,
        List<AlternativaDTO> alternativas
) {
    public static QuestaoResponse fromEntity(Questao q) {
        return QuestaoResponse.builder()
                .id(q.getId())
                .bancaId(q.getBanca() != null ? q.getBanca().getId() : null)
                .bancaSigla(q.getBanca() != null ? q.getBanca().getSigla() : null)
                .concursoId(q.getConcurso() != null ? q.getConcurso().getId() : null)
                .concursoOrgao(q.getConcurso() != null ? q.getConcurso().getOrgao() : null)
                .disciplinaId(q.getDisciplina() != null ? q.getDisciplina().getId() : null)
                .disciplinaNome(q.getDisciplina() != null ? q.getDisciplina().getNome() : null)
                .assuntoId(q.getAssunto() != null ? q.getAssunto().getId() : null)
                .assuntoNome(q.getAssunto() != null ? q.getAssunto().getNome() : null)
                .enunciado(q.getEnunciado())
                .textoBase(q.getTextoBase())
                .tipo(q.getTipo())
                .dificuldade(q.getDificuldade())
                .ano(q.getAno())
                .anulada(q.isAnulada())
                .gabaritoOficial(q.getGabaritoOficial())
                .justificativa(q.getJustificativa())
                .fundamentacaoLegal(q.getFundamentacaoLegal())
                .jurisprudencia(q.getJurisprudencia())
                .alternativas(
                        q.getAlternativas() != null
                                ? q.getAlternativas().stream().map(AlternativaDTO::fromEntity).toList()
                                : List.of()
                )
                .build();
    }
}
