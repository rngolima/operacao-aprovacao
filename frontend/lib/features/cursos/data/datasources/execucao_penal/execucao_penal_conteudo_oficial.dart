import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import 'execucao_penal_aula_01.dart';

/// Acervo Oficial de Legislação Especial / LEP do CRAVOU para Polícia Penal de Pernambuco (PP-PE).
class ExecucaoPenalConteudoOficial {
  ExecucaoPenalConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemExecucaoPenal01,
  ];

  static List<QuestaoModel> get todasAsQuestoes {
    final List<QuestaoModel> lista = [];
    for (final aula in aulas) {
      if (aula.questoes != null) {
        lista.addAll(aula.questoes!);
      }
    }
    return lista;
  }

  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'execucao_penal',
      nome: 'Legislação Especial - LEP (Polícia Penal / PP-PE)',
      icone: '🚔',
      corBadge: const Color(0xFF1E293B),
      totalAulas: aulas.length,
      totalQuestoes: todasAsQuestoes.length,
      aulas: aulas,
    );
  }
}
