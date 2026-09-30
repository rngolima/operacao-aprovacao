import 'package:flutter/material.dart';
import '../../../questoes/data/models/questao_model.dart';
import 'mapa_mental_model.dart';

/// Modelo de Aula Didática do Conteúdo Programático do Edital
class AulaGuiaItem {
  final String numero;
  final String titulo;
  final String detalhes;
  final bool concluida;
  final bool destaque;
  final List<QuestaoModel>? questoes;
  final String? conteudoTeorico;
  final MapaMentalData? mapaMental;

  const AulaGuiaItem({
    required this.numero,
    required this.titulo,
    required this.detalhes,
    this.concluida = false,
    this.destaque = false,
    this.questoes,
    this.conteudoTeorico,
    this.mapaMental,
  });
}

/// Modelo de Módulo / Disciplina Oficial do Edital
class ModuloGuiaEstudo {
  final String id;
  final String nome;
  final String icone;
  final Color corBadge;
  final int totalAulas;
  final int totalQuestoes;
  final List<AulaGuiaItem> aulas;

  const ModuloGuiaEstudo({
    required this.id,
    required this.nome,
    required this.icone,
    required this.corBadge,
    required this.totalAulas,
    required this.totalQuestoes,
    required this.aulas,
  });
}
