import 'package:flutter/foundation.dart';
import '../../data/models/disciplina_model.dart';
import '../../data/models/filtro_questoes.dart';
import '../../data/models/questao_model.dart';
import '../../domain/repositories/questoes_repository.dart';

/// Controller de Questoes e Modo Treino do CRAVOU.
class QuestoesController extends ChangeNotifier {
  final QuestoesRepository _repository;

  List<QuestaoModel> _questoes = [];
  List<DisciplinaModel> _disciplinas = [];
  String _disciplinaAtiva = 'Todas';
  String _buscaTexto = '';
  bool _isLoading = false;

  // Controle de resolucao em tempo real (Modo Treino)
  final Map<int, String> _respostasMarcadas = {};
  final Map<int, bool> _gabaritoRevelado = {};
  int _totalAcertos = 0;
  int _totalErros = 0;

  QuestoesController(this._repository);

  List<QuestaoModel> get questoes => _questoes;
  List<DisciplinaModel> get disciplinas => _disciplinas;
  String get disciplinaAtiva => _disciplinaAtiva;
  bool get isLoading => _isLoading;
  int get totalAcertos => _totalAcertos;
  int get totalErros => _totalErros;

  String? respostaDoAluno(int questaoId) => _respostasMarcadas[questaoId];
  bool isGabaritoRevelado(int questaoId) => _gabaritoRevelado[questaoId] ?? false;

  /// Inicializacao com carga de disciplinas e questoes
  Future<void> inicializar() async {
    _isLoading = true;
    notifyListeners();

    try {
      _disciplinas = await _repository.getDisciplinas();
      await _carregarQuestoes();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Filtra por disciplina selecionada
  Future<void> selecionarDisciplina(String disciplina) async {
    if (_disciplinaAtiva == disciplina) return;
    _disciplinaAtiva = disciplina;
    _isLoading = true;
    notifyListeners();

    try {
      await _carregarQuestoes();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Busca textual
  Future<void> buscar(String termo) async {
    _buscaTexto = termo;
    _isLoading = true;
    notifyListeners();

    try {
      await _carregarQuestoes();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Responde uma questao com feedback instantaneo (Modo Treino Avulso)
  void responder(QuestaoModel questao, String resposta) {
    if (_gabaritoRevelado[questao.id] == true) return; // Ja respondida

    _respostasMarcadas[questao.id] = resposta;
    _gabaritoRevelado[questao.id] = true;

    final acertou = questao.gabaritoOficial.toUpperCase() == resposta.toUpperCase();
    if (acertou) {
      _totalAcertos++;
    } else {
      _totalErros++;
    }

    notifyListeners();
  }

  Future<void> _carregarQuestoes() async {
    final filtro = FiltroQuestoes(
      disciplina: _disciplinaAtiva,
      termoBusca: _buscaTexto,
    );
    _questoes = await _repository.getQuestoes(filtro);
  }
}
