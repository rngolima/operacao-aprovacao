package com.operacaoaprovacao.api.modules.treinamento.domain.model;

/**
 * Controla o ciclo de vida e estado de uma tentativa de simulado realizada pelo aluno.
 */
public enum StatusTentativa {
    EM_ANDAMENTO, // Aluno esta ativamente respondendo a prova
    FINALIZADA,   // Aluno submeteu o gabarito ou o tempo limite expirou (corrigida)
    CANCELADA     // Aluno abandonou ou cancelou expressamente a sessao
}
