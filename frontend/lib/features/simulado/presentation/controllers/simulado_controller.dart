import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../data/models/item_resposta_simulado.dart';
import '../../data/models/resultado_simulado_model.dart';
import '../../data/models/simulado_model.dart';
import '../../domain/repositories/simulado_repository.dart';

/// Controller responsavel pela gerencia de estado reativa do Cockpit do Simulado Cebraspe.
/// Controla cronometro regressivo oficial, auto-save atomico e telemetria de desempenho.
class SimuladoController extends ChangeNotifier {
  final SimuladoRepository repository;

  SimuladoController({required this.repository});

  // Estado do Simulado
  bool _isLoading = true;
  bool _isFinalizando = false;
  String? _errorMessage;
  SimuladoModel? _simulado;
  int? _tentativaId;

  // Navegacao
  int _currentIndex = 0;

  // Respostas e Telemetria
  final Map<int, ItemRespostaSimulado> _respostas = {};
  final Map<int, int> _segundosPorItem = {};

  // Cronometro Regressivo
  int _segundosRestantes = 16200; // 4h 30m (270 min)
  Timer? _cronometroTimer;

  // Resultado Final
  ResultadoSimuladoModel? _resultado;

  // Getters
  bool get isLoading => _isLoading;
  bool get isFinalizando => _isFinalizando;
  String? get errorMessage => _errorMessage;
  SimuladoModel? get simulado => _simulado;
  int? get tentativaId => _tentativaId;
  int get currentIndex => _currentIndex;
  int get segundosRestantes => _segundosRestantes;
  ResultadoSimuladoModel? get resultado => _resultado;

  /// Item atualmente exibido no cockpit
  ItemSimuladoModel? get itemAtual {
    if (_simulado == null || _simulado!.itens.isEmpty) return null;
    if (_currentIndex < 0 || _currentIndex >= _simulado!.itens.length) return null;
    return _simulado!.itens[_currentIndex];
  }

  /// Resposta marcada para o item atual
  ItemRespostaSimulado? get respostaAtual => _respostas[_currentIndex];

  /// Conjunto de índices que já foram respondidos ('C' ou 'E')
  Set<int> get answeredIndices {
    final set = <int>{};
    _respostas.forEach((index, resposta) {
      if (resposta.respostaMarcada != null && resposta.respostaMarcada!.isNotEmpty) {
        set.add(index);
      }
    });
    return set;
  }

  /// Conjunto de índices marcados para revisão tática
  Set<int> get reviewIndices {
    final set = <int>{};
    _respostas.forEach((index, resposta) {
      if (resposta.marcadaParaRevisao) {
        set.add(index);
      }
    });
    return set;
  }

  int get totalQuestoes => _simulado?.itens.length ?? 60;
  int get totalRespondidas => answeredIndices.length;
  int get totalMarcadasRevisao => reviewIndices.length;
  int get totalEmBranco => totalQuestoes - totalRespondidas;

  double get percentualConcluido =>
      totalQuestoes > 0 ? (totalRespondidas / totalQuestoes) : 0.0;

  /// Indica se restam menos de 30 minutos (1.800 segundos) de prova
  bool get isTempoCritico => _segundosRestantes <= 1800;

  /// Formata os segundos restantes no padrao HH:MM:SS
  String get tempoFormatado {
    final horas = (_segundosRestantes ~/ 3600).toString().padLeft(2, '0');
    final minutos = ((_segundosRestantes % 3600) ~/ 60).toString().padLeft(2, '0');
    final segundos = (_segundosRestantes % 60).toString().padLeft(2, '0');
    return '$horas:$minutos:$segundos';
  }

  /// Inicializa o simulado carregando o caderno e disparando o cronometro
  Future<void> inicializar({int? simuladoId}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _simulado = await repository.carregarSimuladoOficial(simuladoId: simuladoId);
      _segundosRestantes = _simulado?.duracaoSegundos ?? 16200;

      // Inicializa mapa de respostas em branco para cada item
      _respostas.clear();
      _segundosPorItem.clear();
      if (_simulado != null) {
        for (int i = 0; i < _simulado!.itens.length; i++) {
          final item = _simulado!.itens[i];
          _respostas[i] = ItemRespostaSimulado(
            numeroQuestao: item.numeroQuestao,
            questaoId: item.questaoId,
            respostaMarcada: null,
            marcadaParaRevisao: false,
            tempoGastoSegundos: 0,
          );
          _segundosPorItem[i] = 0;
        }
      }

      // Inicia a tentativa no backend
      if (_simulado != null) {
        _tentativaId = await repository.iniciarTentativa(_simulado!.id);
      }

      _iniciarCronometro();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Falha ao carregar o simulado oficial: $e';
      notifyListeners();
    }
  }

  void _iniciarCronometro() {
    _cronometroTimer?.cancel();
    _cronometroTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_segundosRestantes > 0) {
        _segundosRestantes--;
        // Incrementa tempo gasto no item atual
        _segundosPorItem[_currentIndex] = (_segundosPorItem[_currentIndex] ?? 0) + 1;
        if (_respostas.containsKey(_currentIndex)) {
          _respostas[_currentIndex]!.tempoGastoSegundos = _segundosPorItem[_currentIndex]!;
        }
        notifyListeners();
      } else {
        timer.cancel();
        // Tempo esgotado: auto-finalizacao oficial
        finalizarSimulado();
      }
    });
  }

  /// Salta para uma questão específica da grade (0 a 59)
  void irParaQuestao(int index) {
    if (index >= 0 && index < totalQuestoes) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Avança para a próxima questão
  void proximaQuestao() {
    if (_currentIndex < totalQuestoes - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  /// Retorna à questão anterior
  void questaoAnterior() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  /// Marca resposta no padrão Cebraspe ('C', 'E' ou null para em branco/abstenção)
  void marcarResposta(String? opcao) {
    if (_simulado == null || _currentIndex >= _simulado!.itens.length) return;

    final item = _simulado!.itens[_currentIndex];
    final respostaExistente = _respostas[_currentIndex];

    _respostas[_currentIndex] = ItemRespostaSimulado(
      numeroQuestao: item.numeroQuestao,
      questaoId: item.questaoId,
      respostaMarcada: opcao,
      marcadaParaRevisao: respostaExistente?.marcadaParaRevisao ?? false,
      tempoGastoSegundos: _segundosPorItem[_currentIndex] ?? 0,
    );

    notifyListeners();

    // Auto-save assíncrono em segundo plano (fire-and-forget resiliente)
    if (_tentativaId != null) {
      repository.registrarResposta(
        tentativaId: _tentativaId!,
        questaoId: item.questaoId,
        respostaMarcada: opcao,
        tempoGastoSegundos: _segundosPorItem[_currentIndex] ?? 0,
      ).catchError((_) {});
    }
  }

  /// Alterna flag de marcação para revisão do item atual
  void alternarRevisao() {
    if (_respostas.containsKey(_currentIndex)) {
      final atual = _respostas[_currentIndex]!;
      _respostas[_currentIndex] = atual.copyWith(
        marcadaParaRevisao: !atual.marcadaParaRevisao,
      );
      notifyListeners();
    }
  }

  /// Submete o simulado e calcula nota oficial Cebraspe (C - E)
  Future<ResultadoSimuladoModel?> finalizarSimulado() async {
    _cronometroTimer?.cancel();
    _isFinalizando = true;
    notifyListeners();

    try {
      final totalSegundosGastos = (_simulado?.duracaoSegundos ?? 16200) - _segundosRestantes;

      _resultado = await repository.finalizarSimulado(
        tentativaId: _tentativaId ?? 1,
        simuladoId: _simulado?.id ?? 1,
        itens: _simulado?.itens ?? [],
        respostas: _respostas,
        tempoTotalSegundos: totalSegundosGastos > 0 ? totalSegundosGastos : 1,
      );

      _isFinalizando = false;
      notifyListeners();
      return _resultado;
    } catch (e) {
      _isFinalizando = false;
      _errorMessage = 'Falha ao submeter simulado: $e';
      notifyListeners();
      return null;
    }
  }

  @override
  void dispose() {
    _cronometroTimer?.cancel();
    super.dispose();
  }
}
