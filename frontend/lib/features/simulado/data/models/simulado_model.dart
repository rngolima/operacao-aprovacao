/// Representa o caderno completo de simulado oficial da PC-PE no padrão Cebraspe.
class SimuladoModel {
  final int id;
  final String titulo;
  final String descricao;
  final String concursoOrgao;
  final int tempoLimiteMinutos; // 270 minutos (4 horas e 30 minutos)
  final int totalQuestoes; // 60 questoes
  final List<ItemSimuladoModel> itens;

  SimuladoModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.concursoOrgao,
    this.tempoLimiteMinutos = 270,
    required this.totalQuestoes,
    required this.itens,
  });

  /// Duração total em segundos para o cronômetro tabular
  int get duracaoSegundos => tempoLimiteMinutos * 60;

  factory SimuladoModel.fromJson(Map<String, dynamic> json) {
    final itensJson = json['itens'] as List<dynamic>? ?? [];
    return SimuladoModel(
      id: json['id'] as int? ?? 1,
      titulo: json['titulo'] as String? ?? 'Simulado Oficial PC-PE',
      descricao: json['descricao'] as String? ?? 'Caderno oficial com 60 itens no formato Cebraspe (Certo / Errado)',
      concursoOrgao: json['concursoOrgao'] as String? ?? 'Polícia Civil de Pernambuco (PC-PE)',
      tempoLimiteMinutos: json['tempoLimiteMinutos'] as int? ?? 270,
      totalQuestoes: json['totalQuestoes'] as int? ?? itensJson.length,
      itens: itensJson.map((e) => ItemSimuladoModel.fromJson(Map<String, dynamic>.from(e as Map))).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'concursoOrgao': concursoOrgao,
      'tempoLimiteMinutos': tempoLimiteMinutos,
      'totalQuestoes': totalQuestoes,
      'itens': itens.map((e) => e.toJson()).toList(),
    };
  }
}

/// Item individual ordenado dentro do caderno de simulado
class ItemSimuladoModel {
  final int id;
  final int numeroQuestao;
  final int questaoId;
  final String enunciado;
  final String? textoBase;
  final String disciplinaNome;
  final String assuntoNome;
  final double peso;
  final String? gabaritoOficial; // 'C' ou 'E' (para auditoria local e fallback)
  final String? explicacaoDidatica;

  ItemSimuladoModel({
    required this.id,
    required this.numeroQuestao,
    required this.questaoId,
    required this.enunciado,
    this.textoBase,
    required this.disciplinaNome,
    required this.assuntoNome,
    this.peso = 1.0,
    this.gabaritoOficial,
    this.explicacaoDidatica,
  });

  factory ItemSimuladoModel.fromJson(Map<String, dynamic> json) {
    return ItemSimuladoModel(
      id: json['id'] as int? ?? json['numeroQuestao'] as int? ?? 1,
      numeroQuestao: json['numeroQuestao'] as int? ?? 1,
      questaoId: json['questaoId'] as int? ?? json['id'] as int? ?? 1,
      enunciado: json['enunciado'] as String? ?? '',
      textoBase: json['textoBase'] as String?,
      disciplinaNome: json['disciplinaNome'] as String? ?? 'CONHECIMENTOS ESPECÍFICOS',
      assuntoNome: json['assuntoNome'] as String? ?? 'DIREITO APLICADO',
      peso: (json['peso'] is num) ? (json['peso'] as num).toDouble() : 1.0,
      gabaritoOficial: json['gabaritoOficial'] as String?,
      explicacaoDidatica: json['explicacaoDidatica'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numeroQuestao': numeroQuestao,
      'questaoId': questaoId,
      'enunciado': enunciado,
      'textoBase': textoBase,
      'disciplinaNome': disciplinaNome,
      'assuntoNome': assuntoNome,
      'peso': peso,
      'gabaritoOficial': gabaritoOficial,
      'explicacaoDidatica': explicacaoDidatica,
    };
  }
}
