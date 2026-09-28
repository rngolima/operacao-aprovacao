import '../../data/models/disciplina_model.dart';
import '../../data/models/filtro_questoes.dart';
import '../../data/models/questao_model.dart';

/// Contrato Abstrato do Repositorio de Questoes.
abstract class QuestoesRepository {
  /// Busca questoes com filtros dinâmicos e paginacao
  Future<List<QuestaoModel>> getQuestoes(FiltroQuestoes filtro);

  /// Retorna as disciplinas ativas no edital
  Future<List<DisciplinaModel>> getDisciplinas();
}
