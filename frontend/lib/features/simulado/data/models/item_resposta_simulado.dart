/// Representa o registro individual de resposta de um item de simulado,
/// rastreando marcacao Cebraspe, revisao pendente e telemetria de segundos.
class ItemRespostaSimulado {
  final int numeroQuestao;
  final int questaoId;
  String? respostaMarcada; // "C", "E" ou null (Abstenção/Em branco)
  bool marcadaParaRevisao;
  int tempoGastoSegundos;

  ItemRespostaSimulado({
    required this.numeroQuestao,
    required this.questaoId,
    this.respostaMarcada,
    this.marcadaParaRevisao = false,
    this.tempoGastoSegundos = 0,
  });

  /// Copia com modificacoes (imutabilidade ou clone de estado)
  ItemRespostaSimulado copyWith({
    int? numeroQuestao,
    int? questaoId,
    String? respostaMarcada,
    bool? marcadaParaRevisao,
    int? tempoGastoSegundos,
  }) {
    return ItemRespostaSimulado(
      numeroQuestao: numeroQuestao ?? this.numeroQuestao,
      questaoId: questaoId ?? this.questaoId,
      respostaMarcada: respostaMarcada ?? this.respostaMarcada,
      marcadaParaRevisao: marcadaParaRevisao ?? this.marcadaParaRevisao,
      tempoGastoSegundos: tempoGastoSegundos ?? this.tempoGastoSegundos,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questaoId': questaoId,
      'respostaMarcada': respostaMarcada,
      'tempoGastoSegundos': tempoGastoSegundos,
    };
  }

  factory ItemRespostaSimulado.fromJson(Map<String, dynamic> json) {
    return ItemRespostaSimulado(
      numeroQuestao: json['numeroQuestao'] as int? ?? 1,
      questaoId: json['questaoId'] as int? ?? 0,
      respostaMarcada: json['respostaMarcada'] as String?,
      marcadaParaRevisao: json['marcadaParaRevisao'] as bool? ?? false,
      tempoGastoSegundos: json['tempoGastoSegundos'] as int? ?? 0,
    );
  }
}
