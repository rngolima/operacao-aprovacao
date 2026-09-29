import '../../domain/repositories/simulado_repository.dart';
import '../datasources/simulado_remote_data_source.dart';
import '../models/item_resposta_simulado.dart';
import '../models/resultado_simulado_model.dart';
import '../models/simulado_model.dart';

/// Implementacao concreta do SimuladoRepository
class SimuladoRepositoryImpl implements SimuladoRepository {
  final SimuladoRemoteDataSource _dataSource;

  SimuladoRepositoryImpl({SimuladoRemoteDataSource? dataSource})
      : _dataSource = dataSource ?? SimuladoRemoteDataSource();

  @override
  Future<SimuladoModel> carregarSimuladoOficial({int? simuladoId}) async {
    return await _dataSource.buscarSimulado(id: simuladoId);
  }

  @override
  Future<int> iniciarTentativa(int simuladoId) async {
    return await _dataSource.iniciarTentativa(simuladoId);
  }

  @override
  Future<void> registrarResposta({
    required int tentativaId,
    required int questaoId,
    required String? respostaMarcada,
    required int tempoGastoSegundos,
  }) async {
    await _dataSource.registrarResposta(
      tentativaId: tentativaId,
      questaoId: questaoId,
      respostaMarcada: respostaMarcada,
      tempoGastoSegundos: tempoGastoSegundos,
    );
  }

  @override
  Future<ResultadoSimuladoModel> finalizarSimulado({
    required int tentativaId,
    required int simuladoId,
    required List<ItemSimuladoModel> itens,
    required Map<int, ItemRespostaSimulado> respostas,
    required int tempoTotalSegundos,
  }) async {
    return await _dataSource.submeterTentativa(
      tentativaId: tentativaId,
      simuladoId: simuladoId,
      itens: itens,
      respostas: respostas,
      tempoTotalSegundos: tempoTotalSegundos,
    );
  }
}
