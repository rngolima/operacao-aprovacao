/// Modelo de Disciplina do Edital Oficial PC-PE.
class DisciplinaModel {
  final int id;
  final String nome;
  final String icone;
  final int totalQuestoes;

  const DisciplinaModel({
    required this.id,
    required this.nome,
    required this.icone,
    required this.totalQuestoes,
  });

  factory DisciplinaModel.fromJson(Map<String, dynamic> json) {
    return DisciplinaModel(
      id: json['id'] as int? ?? 0,
      nome: json['nome'] as String? ?? '',
      icone: json['icone'] as String? ?? '📚',
      totalQuestoes: json['totalQuestoes'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'icone': icone,
        'totalQuestoes': totalQuestoes,
      };
}
