package com.operacaoaprovacao.api.modules.certame.domain.model;

/**
 * Enum que representa o ciclo de vida e status oficial de um concurso publico.
 */
public enum StatusConcurso {
    PREVISTO,
    COMISSAO_FORMADA,
    BANCA_DEFINIDA,
    EDITAL_PUBLICADO,
    INSCRICOES_ABERTAS,
    EM_ANDAMENTO,
    ENCERRADO,
    HOMOLOGADO
}
