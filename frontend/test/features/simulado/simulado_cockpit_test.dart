import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/cravou_brand_header.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/item_resposta_simulado.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/resultado_simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/domain/repositories/simulado_repository.dart';
import 'package:operacao_aprovacao_app/features/simulado/presentation/controllers/simulado_controller.dart';
import 'package:operacao_aprovacao_app/features/simulado/presentation/screens/simulado_cockpit_screen.dart';

class MockSimuladoRepository implements SimuladoRepository {
  @override
  Future<SimuladoModel> carregarSimuladoOficial({int? simuladoId}) async {
    return SimuladoModel(
      id: 1,
      titulo: 'Simulado Teste PC-PE',
      descricao: 'Teste',
      concursoOrgao: 'PC-PE',
      tempoLimiteMinutos: 270,
      totalQuestoes: 2,
      itens: [
        ItemSimuladoModel(
          id: 1,
          numeroQuestao: 1,
          questaoId: 101,
          enunciado: 'Enunciado do Item 1 sobre Direito Penal.',
          disciplinaNome: 'DIREITO PENAL',
          assuntoNome: 'TEORIA DO CRIME',
          gabaritoOficial: 'C',
        ),
        ItemSimuladoModel(
          id: 2,
          numeroQuestao: 2,
          questaoId: 102,
          enunciado: 'Enunciado do Item 2 sobre Processo Penal.',
          disciplinaNome: 'DIREITO PROCESSUAL PENAL',
          assuntoNome: 'INQUÉRITO POLICIAL',
          gabaritoOficial: 'E',
        ),
      ],
    );
  }

  @override
  Future<int> iniciarTentativa(int simuladoId) async => 100;

  @override
  Future<void> registrarResposta({
    required int tentativaId,
    required int questaoId,
    required String? respostaMarcada,
    required int tempoGastoSegundos,
  }) async {}

  @override
  Future<ResultadoSimuladoModel> finalizarSimulado({
    required int tentativaId,
    required int simuladoId,
    required List<ItemSimuladoModel> itens,
    required Map<int, ItemRespostaSimulado> respostas,
    required int tempoTotalSegundos,
  }) async {
    return ResultadoSimuladoModel(
      tentativaId: tentativaId,
      simuladoId: simuladoId,
      simuladoTitulo: 'Simulado PC-PE',
      tempoTotalSegundos: tempoTotalSegundos,
      pontuacaoLiquida: 2.0,
      totalAcertos: 2,
      totalErros: 0,
      totalEmBranco: 0,
      totalQuestoes: 2,
      aprovado: true,
    );
  }
}

void main() {
  testWidgets('SimuladoCockpitScreen deve renderizar Header com Co-Branding e interagir com botões Cebraspe',
      (WidgetTester tester) async {
    final repo = MockSimuladoRepository();
    final controller = SimuladoController(repository: repo);
    await controller.inicializar();

    await tester.pumpWidget(
      MaterialApp(
        home: SimuladoCockpitScreen(controller: controller),
      ),
    );
    await tester.pump();

    // Verifica Co-Branding Cravou ✕ PC-PE
    expect(find.byType(CravouBrandHeader), findsOneWidget);
    expect(find.byType(TacticalOwlLogo), findsOneWidget);
    expect(find.text('PC-PE'), findsOneWidget);

    // Verifica número do item e disciplina
    expect(find.text('ITEM 1 DE 2'), findsOneWidget);
    expect(find.text('DIREITO PENAL • TEORIA DO CRIME'), findsOneWidget);
    expect(find.text('Enunciado do Item 1 sobre Direito Penal.'), findsOneWidget);

    // Verifica botões Cebraspe
    expect(find.text('[ CERTO ]'), findsOneWidget);
    expect(find.text('[ ERRADO ]'), findsOneWidget);
    expect(find.text('[ Deixar em Branco / Abstenção ]'), findsOneWidget);

    // Clica no botão '[ CERTO ]'
    await tester.tap(find.text('[ CERTO ]'));
    await tester.pump();

    expect(controller.respostaAtual?.respostaMarcada, equals('C'));
    expect(controller.totalRespondidas, equals(1));

    // Abre a Grade de Navegação
    final botaoGrade = find.text('GRADE (1-2)');
    expect(botaoGrade, findsOneWidget);
    await tester.tap(botaoGrade);
    await tester.pumpAndSettle();

    // Modal aberto: verifica título da grade
    expect(find.text('GRADE DE NAVEGAÇÃO'), findsOneWidget);

    // Fecha a grade voltando ao cockpit
    final botaoVoltar = find.text('VOLTAR AO COCKPIT');
    expect(botaoVoltar, findsOneWidget);
    await tester.tap(botaoVoltar);
    await tester.pumpAndSettle();

    // Avança para a questão 2
    final botaoProximo = find.byTooltip('Próxima Questão');
    expect(botaoProximo, findsOneWidget);
    await tester.tap(botaoProximo);
    await tester.pump();

    expect(controller.currentIndex, equals(1));
    expect(find.text('ITEM 2 DE 2'), findsOneWidget);

    controller.dispose();
  });
}
