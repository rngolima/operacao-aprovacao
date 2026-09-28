package com.operacaoaprovacao.api.modules.treinamento.domain.model;

/**
 * Define a modalidade e objetivo do simulado gerado.
 */
public enum ModoSimulado {
    PROVA_COMPLETA,   // Simula o edital integral (ex: 60 questoes PC-PE nas proporcoes oficiais)
    POR_DISCIPLINA,   // Treinamento focado em uma materia especifica (ex: 30 questoes de Direito Penal)
    PERSONALIZADO     // Criado pelo aluno com filtros customizados de materias e bancas
}
