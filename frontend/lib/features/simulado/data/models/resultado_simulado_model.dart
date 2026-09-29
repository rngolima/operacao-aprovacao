/// Representa o resultado executivo oficial do simulado corrigido pela banca Cebraspe.
class ResultadoSimuladoModel {
  final int tentativaId;
  final int simuladoId;
  final String simuladoTitulo;
  final int tempoTotalSegundos;
  final double pontuacaoLiquida; // Nota = Acertos - Erros (Cebraspe)
  final int totalAcertos;
  final int totalErros;
  final int totalEmBranco;
  final int totalQuestoes;
  final bool aprovado;
  final Map<String, DesempenhoDisciplinaSimulado> desempenhoPorDisciplina;

  ResultadoSimuladoModel({
    required this.tentativaId,
    required this.simuladoId,
    required this.simuladoTitulo,
    required this.tempoTotalSegundos,
    required this.pontuacaoLiquida,
    required this.totalAcertos,
    required this.totalErros,
    required this.totalEmBranco,
    required this.totalQuestoes,
    required this.aprovado,
    this.desempenhoPorDisciplina = const {},
  });

  /// Percentual de acertos brutos em relacao ao total
  double get percentualBruto =>
      totalQuestoes > 0 ? (totalAcertos / totalQuestoes) * 100 : 0.0;

  /// Aproveitamento liquido Cebraspe (percentual maximo possivel)
  double get aproveitamentoLiquido =>
      totalQuestoes > 0 ? (pontuacaoLiquida / totalQuestoes) * 100 : 0.0;

  /// Formatacao amigavel do tempo total gasto (hh:mm:ss)
  String get tempoFormatado {
    final horas = (tempoTotalSegundos ~/ 3600).toString().padLeft(2, '0');
    final minutos = ((tempoTotalSegundos % 3600) ~/ 60).toString().padLeft(2, '0');
    final segundos = (tempoTotalSegundos % 60).toString().padLeft(2, '0');
    return '$horas:$minutos:$segundos';
  }

  factory ResultadoSimuladoModel.fromJson(Map<String, dynamic> json) {
    final disciplinasMap = <String, DesempenhoDisciplinaSimulado>{};
    if (json['desempenhoPorDisciplina'] is Map) {
      (json['desempenhoPorDisciplina'] as Map).forEach((key, value) {
        disciplinasMap[key.toString()] = DesempenhoDisciplinaSimulado.fromJson(
          Map<String, dynamic>.from(value as Map),
        );
      });
    }

    final pontuacao = (json['pontuacaoLiquida'] is num)
        ? (json['pontuacaoLiquida'] as num).toDouble()
        : 0.0;

    final totalQuestoes = json['totalQuestoes'] as int? ?? 60;
    // Criterio Cebraspe PC-PE: nota líquida mínima >= 36.0 (60% da prova) ou configurável
    final aprovado = json['aprovado'] as bool? ?? (pontuacao >= 36.0);

    return ResultadoSimuladoModel(
      tentativaId: json['tentativaId'] as int? ?? json['id'] as int? ?? 0,
      simuladoId: json['simuladoId'] as int? ?? 0,
      simuladoTitulo: json['simuladoTitulo'] as String? ?? 'Simulado Oficial PC-PE',
      tempoTotalSegundos: json['tempoTotalSegundos'] as int? ?? 0,
      pontuacaoLiquida: pontuacao,
      totalAcertos: json['totalAcertos'] as int? ?? 0,
      totalErros: json['totalErros'] as int? ?? 0,
      totalEmBranco: json['totalEmBranco'] as int? ?? 0,
      totalQuestoes: totalQuestoes,
      aprovado: aprovado,
      desempenhoPorDisciplina: disciplinasMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tentativaId': tentativaId,
      'simuladoId': simuladoId,
      'simuladoTitulo': simuladoTitulo,
      'tempoTotalSegundos': tempoTotalSegundos,
      'pontuacaoLiquida': pontuacaoLiquida,
      'totalAcertos': totalAcertos,
      'totalErros': totalErros,
      'totalEmBranco': totalEmBranco,
      'totalQuestoes': totalQuestoes,
      'aprovado': aprovado,
      'desempenhoPorDisciplina': desempenhoPorDisciplina.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
    };
  }
}

/// Métrica de desempenho agrupada por disciplina no simulado
class DesempenhoDisciplinaSimulado {
  final String disciplina;
  final int totalItens;
  final int acertos;
  final int erros;
  final int emBranco;

  DesempenhoDisciplinaSimulado({
    required this.disciplina,
    required this.totalItens,
    required this.acertos,
    required this.erros,
    required this.emBranco,
  });

  int get saldoLiquido => acertos - erros;

  factory DesempenhoDisciplinaSimulado.fromJson(Map<String, dynamic> json) {
    return DesempenhoDisciplinaSimulado(
      disciplina: json['disciplina'] as String? ?? '',
      totalItens: json['totalItens'] as int? ?? 0,
      acertos: json['acertos'] as int? ?? 0,
      erros: json['erros'] as int? ?? 0,
      emBranco: json['emBranco'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'disciplina': disciplina,
      'totalItens': totalItens,
      'acertos': acertos,
      'erros': erros,
      'emBranco': emBranco,
    };
  }
}
