import '../../data/models/item_resposta_simulado.dart';
import '../../data/models/resultado_simulado_model.dart';
import '../../data/models/simulado_model.dart';

/// Contrato da camada de Dominio para execucao e gestao de simulados Cebraspe
abstract class SimuladoRepository {
  /// Recupera um simulado oficial pelo ID ou gera um novo caderno PC-PE com 60 itens
  Future<SimuladoModel> carregarSimuladoOficial({int? simuladoId});

  /// Registra o inicio oficial da prova gerando uma nova tentativa e disparando cronometro
  Future<int> iniciarTentativa(int simuladoId);

  /// Auto-save atomico de uma questao com telemetria de segundos gastos
  Future<void> registrarResposta({
    required int tentativaId,
    required int questaoId,
    required String? respostaMarcada,
    required int tempoGastoSegundos,
  });

  /// Submete o caderno preenchido para correcao oficial Cebraspe com calculo de nota liquida
  Future<ResultadoSimuladoModel> finalizarSimulado({
    required int tentativaId,
    required int simuladoId,
    required List<ItemSimuladoModel> itens,
    required Map<int, ItemRespostaSimulado> respostas,
    required int tempoTotalSegundos,
  });
}
