package com.operacaoaprovacao.api.modules.questao.application.dto;

import com.operacaoaprovacao.api.modules.questao.domain.model.TipoQuestao;
import lombok.Builder;

/**
 * DTO com os filtros opcionais de busca enviados pelo concurseiro.
 */
@Builder
public record FiltroQuestaoRequest(
        Long disciplinaId,
        Long assuntoId,
        Long bancaId,
        Integer ano,
        TipoQuestao tipo
) {}
