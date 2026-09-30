import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/item_resposta_simulado.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/resultado_simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/presentation/screens/simulado_revisao_screen.dart';

void main() {
  late ResultadoSimuladoModel dummyResultado;
  late List<ItemSimuladoModel> dummyItens;
  late Map<int, ItemRespostaSimulado> dummyRespostas;

  setUp(() {
    dummyResultado = ResultadoSimuladoModel(
      tentativaId: 101,
      simuladoId: 1,
      simuladoTitulo: 'Simulado Oficial PC-PE',
      tempoTotalSegundos: 5400,
      pontuacaoLiquida: 38.0,
      totalAcertos: 44,
      totalErros: 6,
      totalEmBranco: 10,
      totalQuestoes: 60,
      aprovado: true,
    );

    dummyItens = [
      ItemSimuladoModel(
        id: 1,
        numeroQuestao: 1,
        questaoId: 10,
        enunciado: 'A autoridade policial não poderá determinar o arquivamento de inquérito.',
        disciplinaNome: 'DIREITO PROCESSUAL PENAL',
        assuntoNome: 'Inquérito Policial',
        gabaritoOficial: 'C',
        explicacaoDidatica: 'Art. 17 do CPP veda expressamente o arquivamento pela autoridade policial.',
      ),
      ItemSimuladoModel(
        id: 2,
        numeroQuestao: 2,
        questaoId: 11,
        enunciado: 'O crime de homicídio contra policial civil no exercício da função é simples.',
        disciplinaNome: 'DIREITO PENAL',
        assuntoNome: 'Crimes contra a Pessoa',
        gabaritoOficial: 'E',
        explicacaoDidatica: 'Trata-se de homicídio qualificado funcional e crime hediondo.',
      ),
      ItemSimuladoModel(
        id: 3,
        numeroQuestao: 3,
        questaoId: 12,
        enunciado: 'Em caso de flagrante delito à noite, o ingresso domiciliar depende de mandado judicial.',
        disciplinaNome: 'DIREITO CONSTITUCIONAL',
        assuntoNome: 'Direitos Fundamentais',
        gabaritoOficial: 'E',
        explicacaoDidatica: 'Flagrante independe de dia ou noite e prescinde de ordem judicial.',
      ),
    ];

    dummyRespostas = {
      0: ItemRespostaSimulado(
        numeroQuestao: 1,
        questaoId: 10,
        respostaMarcada: 'C', // Acerto
        marcadaParaRevisao: false,
        tempoGastoSegundos: 65,
      ),
      1: ItemRespostaSimulado(
        numeroQuestao: 2,
        questaoId: 11,
        respostaMarcada: 'C', // Erro (marcou C, gabarito é E)
        marcadaParaRevisao: true,
        tempoGastoSegundos: 90,
      ),
      2: ItemRespostaSimulado(
        numeroQuestao: 3,
        questaoId: 12,
        respostaMarcada: null, // Em Branco
        marcadaParaRevisao: false,
        tempoGastoSegundos: 30,
      ),
    };
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: SimuladoRevisaoScreen(
        resultado: dummyResultado,
        itens: dummyItens,
        respostas: dummyRespostas,
      ),
    );
  }

  group('SimuladoRevisaoScreen - Widget Tests', () {
    testWidgets('Renderiza Header, Nota Líquida e Filtros de Estado', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Topo
      expect(find.text('Revisão de Gabarito'), findsOneWidget);
      expect(find.textContaining('Simulado Oficial PC-PE'), findsOneWidget);
      expect(find.text('38.0 pts'), findsOneWidget);

      // Filtros rápidos
      expect(find.text('Todos'), findsOneWidget);
      expect(find.text('Acertos'), findsOneWidget);
      expect(find.text('Erros'), findsOneWidget);
      expect(find.text('Em Branco'), findsOneWidget);
    });

    testWidgets('Renderiza itens com respostas, gabarito e fundamentação didática', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Valida itens renderizados
      expect(find.text('ITEM #1'), findsOneWidget);
      expect(find.text('ITEM #2'), findsOneWidget);

      // Valida status individual de pontuação
      expect(find.text('CRAVOU! ACERTO (+1.0)'), findsOneWidget);
      expect(find.text('ERRO (-1.0 PT CEBRASPE)'), findsOneWidget);

      // Valida fundamentação didática autoral
      expect(find.textContaining('Fundamentação Didática Cravou!'), findsWidgets);
      expect(find.textContaining('Art. 17 do CPP'), findsOneWidget);
    });

    testWidgets('Filtra lista quando seleciona categoria Acertos ou Erros', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Clica no filtro de Erros
      await tester.tap(find.text('Erros'));
      await tester.pumpAndSettle();

      // Apenas o item #2 deve estar visível
      expect(find.text('ITEM #2'), findsOneWidget);
      expect(find.text('ITEM #1'), findsNothing);

      // Clica no filtro de Acertos
      await tester.tap(find.text('Acertos'));
      await tester.pumpAndSettle();

      // Apenas o item #1 deve estar visível
      expect(find.text('ITEM #1'), findsOneWidget);
      expect(find.text('ITEM #2'), findsNothing);
    });
  });
}
