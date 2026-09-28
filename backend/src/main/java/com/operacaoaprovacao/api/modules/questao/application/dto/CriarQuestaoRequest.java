package com.operacaoaprovacao.api.modules.questao.application.dto;

import com.operacaoaprovacao.api.modules.questao.domain.model.DificuldadeQuestao;
import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

import java.util.List;

/**
 * DTO para cadastro de novas questoes com validacoes rigorosas de entrada (Bean Validation).
 */
@Builder
public record CriarQuestaoRequest(
        @NotNull(message = "O ID da banca examinadora e obrigatorio.")
        Long bancaId,

        Long concursoId,

        @NotNull(message = "O ID da disciplina e obrigatorio.")
        Long disciplinaId,

        @NotNull(message = "O ID do assunto e obrigatorio.")
        Long assuntoId,

        @NotBlank(message = "O enunciado da questao e obrigatorio.")
        String enunciado,

        String textoBase,

        @NotNull(message = "O tipo da questao (CERTO_ERRADO ou MULTIPLA_ESCOLHA) e obrigatorio.")
        TipoQuestao tipo,

        @NotNull(message = "O nivel de dificuldade e obrigatorio.")
        DificuldadeQuestao dificuldade,

        @NotNull(message = "O ano do certame e obrigatorio.")
        @Min(value = 1990, message = "O ano deve ser igual ou superior a 1990.")
        Integer ano,

        @NotBlank(message = "O gabarito oficial e obrigatorio.")
        String gabaritoOficial,

        String justificativa,
        String fundamentacaoLegal,
        String jurisprudencia,

        @Valid
        List<CriarAlternativaRequest> alternativas
) {
    @Builder
    public record CriarAlternativaRequest(
            @NotBlank(message = "A letra da alternativa e obrigatoria.")
            String letra,

            @NotBlank(message = "O texto da alternativa e obrigatorio.")
            String texto,

            boolean correta,
            String explicacao
    ) {}
}
