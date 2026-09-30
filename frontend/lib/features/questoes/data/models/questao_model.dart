/// Modelo de Dados de Questao Cebraspe da Plataforma CRAVOU.
/// Estrutura oficial para provas Certo/Errado com fundamentacao didatica autoral.
class QuestaoModel {
  final int id;
  final String banca;
  final String orgao;
  final String cargo;
  final int ano;
  final String disciplina;
  final String assunto;
  final String enunciado;
  final String gabaritoOficial; // 'CERTO', 'ERRADO' ou 'A', 'B', 'C', 'D', 'E'
  final String comentarioDidatico;
  final bool anulada;
  final Map<String, String>? alternativas;
  final String? tipoQuestao;

  const QuestaoModel({
    required this.id,
    this.banca = 'Cebraspe',
    this.orgao = 'PC-PE',
    this.cargo = 'Agente de Polícia',
    this.ano = 2024,
    required this.disciplina,
    required this.assunto,
    required this.enunciado,
    required this.gabaritoOficial,
    required this.comentarioDidatico,
    this.anulada = false,
    this.alternativas,
    this.tipoQuestao,
  });

  factory QuestaoModel.fromJson(Map<String, dynamic> json) {
    return QuestaoModel(
      id: json['id'] as int? ?? 0,
      banca: json['banca'] as String? ?? 'Cebraspe',
      orgao: json['orgao'] as String? ?? 'PC-PE',
      cargo: json['cargo'] as String? ?? 'Agente de Polícia',
      ano: json['ano'] as int? ?? 2024,
      disciplina: json['disciplina'] as String? ?? 'Língua Portuguesa',
      assunto: json['assunto'] as String? ?? 'Geral',
      enunciado: json['enunciado'] as String? ?? '',
      gabaritoOficial: json['gabaritoOficial'] as String? ?? 'CERTO',
      comentarioDidatico: json['comentarioDidatico'] as String? ?? '',
      anulada: json['anulada'] as bool? ?? false,
      alternativas: json['alternativas'] != null
          ? Map<String, String>.from(json['alternativas'] as Map)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'banca': banca,
        'orgao': orgao,
        'cargo': cargo,
        'ano': ano,
        'disciplina': disciplina,
        'assunto': assunto,
        'enunciado': enunciado,
        'gabaritoOficial': gabaritoOficial,
        'comentarioDidatico': comentarioDidatico,
        'anulada': anulada,
        if (alternativas != null) 'alternativas': alternativas,
      };
}
