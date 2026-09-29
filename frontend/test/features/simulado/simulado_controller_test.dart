import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/item_resposta_simulado.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/resultado_simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/domain/repositories/simulado_repository.dart';
import 'package:operacao_aprovacao_app/features/simulado/presentation/controllers/simulado_controller.dart';

class FakeSimuladoRepository implements SimuladoRepository {
  bool registrarRespostaChamado = false;
  bool finalizarSimuladoChamado = false;

  @override
  Future<SimuladoModel> carregarSimuladoOficial({int? simuladoId}) async {
    return SimuladoModel(
      id: 1,
      titulo: 'Simulado Fake Test',
      descricao: 'Teste',
      concursoOrgao: 'PC-PE',
      tempoLimiteMinutos: 270,
      totalQuestoes: 3,
      itens: [
        ItemSimuladoModel(
          id: 1,
          numeroQuestao: 1,
          questaoId: 101,
          enunciado: 'Questão 1',
          disciplinaNome: 'PORTUGUÊS',
          assuntoNome: 'CRASE',
          gabaritoOficial: 'C',
        ),
        ItemSimuladoModel(
          id: 2,
          numeroQuestao: 2,
          questaoId: 102,
          enunciado: 'Questão 2',
          disciplinaNome: 'DIREITO PENAL',
          assuntoNome: 'CRIMES',
          gabaritoOficial: 'E',
        ),
        ItemSimuladoModel(
          id: 3,
          numeroQuestao: 3,
          questaoId: 103,
          enunciado: 'Questão 3',
          disciplinaNome: 'INFORMÁTICA',
          assuntoNome: 'REDES',
          gabaritoOficial: 'C',
        ),
      ],
    );
  }

  @override
  Future<int> iniciarTentativa(int simuladoId) async => 999;

  @override
  Future<void> registrarResposta({
    required int tentativaId,
    required int questaoId,
    required String? respostaMarcada,
    required int tempoGastoSegundos,
  }) async {
    registrarRespostaChamado = true;
  }

  @override
  Future<ResultadoSimuladoModel> finalizarSimulado({
    required int tentativaId,
    required int simuladoId,
    required List<ItemSimuladoModel> itens,
    required Map<int, ItemRespostaSimulado> respostas,
    required int tempoTotalSegundos,
  }) async {
    finalizarSimuladoChamado = true;
    return ResultadoSimuladoModel(
      tentativaId: tentativaId,
      simuladoId: simuladoId,
      simuladoTitulo: 'Simulado Teste',
      tempoTotalSegundos: tempoTotalSegundos,
      pontuacaoLiquida: 2.0,
      totalAcertos: 2,
      totalErros: 0,
      totalEmBranco: 1,
      totalQuestoes: 3,
      aprovado: true,
    );
  }
}

void main() {
  group('SimuladoController Tests', () {
    late FakeSimuladoRepository fakeRepo;
    late SimuladoController controller;

    setUp(() {
      fakeRepo = FakeSimuladoRepository();
      controller = SimuladoController(repository: fakeRepo);
    });

    tearDown(() {
      controller.dispose();
    });

    test('Deve inicializar o caderno com 3 itens e tempo tabular de 16.200s', () async {
      await controller.inicializar();

      expect(controller.isLoading, isFalse);
      expect(controller.simulado, isNotNull);
      expect(controller.totalQuestoes, equals(3));
      expect(controller.tentativaId, equals(999));
      expect(controller.currentIndex, equals(0));
      expect(controller.totalRespondidas, equals(0));
      expect(controller.totalEmBranco, equals(3));
      expect(controller.itemAtual?.numeroQuestao, equals(1));
    });

    test('Deve marcar resposta C e atualizar contadores e answeredIndices', () async {
      await controller.inicializar();

      controller.marcarResposta('C');
      expect(controller.respostaAtual?.respostaMarcada, equals('C'));
      expect(controller.totalRespondidas, equals(1));
      expect(controller.totalEmBranco, equals(2));
      expect(controller.answeredIndices.contains(0), isTrue);

      // Marca como em branco (abstenção)
      controller.marcarResposta(null);
      expect(controller.respostaAtual?.respostaMarcada, isNull);
      expect(controller.totalRespondidas, equals(0));
      expect(controller.totalEmBranco, equals(3));
      expect(controller.answeredIndices.contains(0), isFalse);
    });

    test('Deve navegar entre as questões e respeitar os limites', () async {
      await controller.inicializar();

      expect(controller.currentIndex, equals(0));

      controller.proximaQuestao();
      expect(controller.currentIndex, equals(1));

      controller.proximaQuestao();
      expect(controller.currentIndex, equals(2));

      // Não pode passar do total - 1
      controller.proximaQuestao();
      expect(controller.currentIndex, equals(2));

      controller.questaoAnterior();
      expect(controller.currentIndex, equals(1));

      controller.irParaQuestao(0);
      expect(controller.currentIndex, equals(0));
    });

    test('Deve alternar flag de revisão da questão', () async {
      await controller.inicializar();

      expect(controller.respostaAtual?.marcadaParaRevisao, isFalse);
      expect(controller.totalMarcadasRevisao, equals(0));

      controller.alternarRevisao();
      expect(controller.respostaAtual?.marcadaParaRevisao, isTrue);
      expect(controller.totalMarcadasRevisao, equals(1));
      expect(controller.reviewIndices.contains(0), isTrue);

      controller.alternarRevisao();
      expect(controller.respostaAtual?.marcadaParaRevisao, isFalse);
      expect(controller.totalMarcadasRevisao, equals(0));
    });

    test('Deve finalizar o simulado e obter o ResultadoSimuladoModel', () async {
      await controller.inicializar();
      controller.marcarResposta('C');

      final resultado = await controller.finalizarSimulado();

      expect(fakeRepo.finalizarSimuladoChamado, isTrue);
      expect(resultado, isNotNull);
      expect(resultado?.pontuacaoLiquida, equals(2.0));
      expect(controller.resultado, isNotNull);
    });
  });
}
