/// Filtro Dinamico de Questoes para Treino no CRAVOU.
class FiltroQuestoes {
  final String? disciplina;
  final String? assunto;
  final String? termoBusca;
  final int page;
  final int size;

  const FiltroQuestoes({
    this.disciplina,
    this.assunto,
    this.termoBusca,
    this.page = 0,
    this.size = 10,
  });

  FiltroQuestoes copyWith({
    String? disciplina,
    String? assunto,
    String? termoBusca,
    int? page,
    int? size,
  }) {
    return FiltroQuestoes(
      disciplina: disciplina ?? this.disciplina,
      assunto: assunto ?? this.assunto,
      termoBusca: termoBusca ?? this.termoBusca,
      page: page ?? this.page,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{
      'page': page,
      'size': size,
    };
    if (disciplina != null && disciplina!.isNotEmpty && disciplina != 'Todas') {
      params['disciplina'] = disciplina;
    }
    if (assunto != null && assunto!.isNotEmpty) {
      params['assunto'] = assunto;
    }
    if (termoBusca != null && termoBusca!.trim().isNotEmpty) {
      params['q'] = termoBusca!.trim();
    }
    return params;
  }
}
