import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import 'direito_penal_aula_01.dart';

/// Acervo Oficial de Direito Penal do CRAVOU para PC-PE e PP-PE.
class DireitoPenalConteudoOficial {
  DireitoPenalConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemDireitoPenal01,
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
      id: 'direito_penal',
      nome: 'Direito Penal (PC-PE / PP-PE)',
      icone: '⚖️',
      corBadge: const Color(0xFFDC2626),
      totalAulas: aulas.length,
      totalQuestoes: todasAsQuestoes.length,
      aulas: aulas,
    );
  }
}
