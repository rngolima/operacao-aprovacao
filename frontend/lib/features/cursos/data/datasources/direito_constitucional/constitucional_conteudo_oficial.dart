import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import 'constitucional_aula_01.dart';

/// Acervo Oficial de Direito Constitucional do CRAVOU para PM-PE, PC-PE e PP-PE.
class ConstitucionalConteudoOficial {
  ConstitucionalConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemConstitucional01,
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
      id: 'constitucional',
      nome: 'Direito Constitucional (PM-PE / PC-PE / PP-PE)',
      icone: '🏛️',
      corBadge: const Color(0xFFB45309),
      totalAulas: aulas.length,
      totalQuestoes: todasAsQuestoes.length,
      aulas: aulas,
    );
  }
}
