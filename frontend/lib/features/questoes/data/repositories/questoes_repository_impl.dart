import '../../domain/repositories/questoes_repository.dart';
import '../datasources/questoes_remote_data_source.dart';
import '../models/disciplina_model.dart';
import '../models/filtro_questoes.dart';
import '../models/questao_model.dart';

/// Implementacao Concreta do Repositorio de Questoes.
class QuestoesRepositoryImpl implements QuestoesRepository {
  final QuestoesRemoteDataSource remoteDataSource;

  QuestoesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<QuestaoModel>> getQuestoes(FiltroQuestoes filtro) {
    return remoteDataSource.getQuestoes(filtro);
  }

  @override
  Future<List<DisciplinaModel>> getDisciplinas() {
    return remoteDataSource.getDisciplinas();
  }
}
