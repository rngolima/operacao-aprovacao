import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/core/state/plano_estudo_state.dart';
import 'package:operacao_aprovacao_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:operacao_aprovacao_app/features/dashboard/presentation/screens/planejador_tatico_screen.dart';

void main() {
  Widget createWidgetUnderTest({
    String userName = 'Rudson Lima',
    String concursoAlvo = 'PM-PE (Polícia Militar de Pernambuco)',
  }) {
    return MaterialApp(
      home: DashboardScreen(
        userName: userName,
        concursoAlvo: concursoAlvo,
      ),
    );
  }

  group('DashboardScreen (Meu Painel) - Widget Tests', () {
    setUp(() {
      PlanoEstudoState.instance.atualizarPlano(
        concursoAlvo: 'PM-PE (Polícia Militar de Pernambuco)',
        cargoAlvo: 'Soldado da PM',
        banca: 'Instituto IAUPE / AOCP',
        horasPorDia: 3,
        semanasAteProva: 10,
        disciplinas: const [
          'Língua Portuguesa',
          'História de Pernambuco',
          'Geografia de Pernambuco',
          'Matemática e Raciocínio Lógico',
          'Noções de Direito Constitucional & Legislação da PMPE',
        ],
      );
    });

    testWidgets('Renderiza Header Fiel à Imagem (Foguinho 12 dias, Iniciais e Foco PM-PE)', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Valida logo Coruja no AppBar
      expect(find.byType(TacticalOwlLogo), findsOneWidget);

      // Pílula com o foguinho e sequência: "🔥 12 dias seguidos" (conforme imagem)
      expect(find.text('12 dias seguidos'), findsOneWidget);
      expect(find.text('🔥'), findsWidgets);

      // Iniciais e Foco do candidato no topo
      expect(find.text('RL'), findsOneWidget);
      expect(find.text('Rudson Lima'), findsOneWidget);
      expect(find.text('Foco: PM-PE Soldado'), findsOneWidget);

      // Botão "Planejamento de Estudos" substitui "Adicionar Edital"
      expect(find.text('Planejamento de Estudos'), findsOneWidget);
      expect(find.text('Adicionar Edital'), findsNothing);
      expect(find.text('Adicionar Edital (IA)'), findsNothing);

      // Banner de Contagem Regressiva para a Prova da PM-PE
      expect(find.textContaining('CONTAGEM REGRESSIVA: 68 DIAS PARA A PROVA DA PM-PE'), findsOneWidget);
    });

    testWidgets('Navega para PlanejadorTaticoScreen com foco estrito na PM-PE e rigor do edital', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Clica em Planejamento de Estudos
      final btnPlanejamento = find.text('Planejamento de Estudos');
      await tester.ensureVisible(btnPlanejamento);
      await tester.tap(btnPlanejamento);
      await tester.pumpAndSettle();

      // Valida elementos do Planejador Tático
      expect(find.byType(PlanejadorTaticoScreen), findsOneWidget);
      expect(find.text('Planejamento de Estudos'), findsWidgets);
      expect(find.text('CRONOGRAMA RIGOROSO DO EDITAL DA PMPE'), findsOneWidget);
      expect(find.text('Sua Disponibilidade Diária de Estudos'), findsOneWidget);
      expect(find.text('As 4 Fases do Seu Cronograma de Guerra'), findsOneWidget);
      expect(find.text('68 dias p/ a prova'), findsOneWidget);

      // Seleciona 4 horas/dia
      await tester.tap(find.text('4 horas/dia'));
      await tester.pump();

      // Salva e atualiza
      final btnSalvar = find.text('SALVAR E ATUALIZAR MEU CRONOGRAMA');
      await tester.ensureVisible(btnSalvar);
      await tester.tap(btnSalvar);
      await tester.pumpAndSettle();

      // Volta ao Painel com 4h/dia atualizadas
      expect(PlanoEstudoState.instance.horasPorDia, equals(4));
    });

    testWidgets('Renderiza Métricas de Desempenho focadas na PM-PE', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Métricas da PM-PE
      expect(find.text('RESOLVIDAS'), findsOneWidget);
      expect(find.text('ACERTOS (+1)'), findsOneWidget);
      expect(find.text('ERROS (-1)'), findsOneWidget);
      expect(find.text('PONTOS PM-PE'), findsOneWidget);
      expect(find.textContaining('História de Pernambuco (IAUPE)'), findsOneWidget);
    });

    testWidgets('Renderiza Meta de Hoje, Concurso Alvo Único e Guia de Estudos da PM-PE', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Card Meta de Hoje
      expect(find.textContaining('META DE HOJE'), findsOneWidget);

      // Concurso Alvo Único (foco 100%, sem poluir com outros certames)
      expect(find.text('SEU CONCURSO ALVO (FOCO 100%)'), findsOneWidget);
      expect(find.text('SIMULADO DO ALVO'), findsOneWidget);

      // Guia de Estudos da PM-PE
      expect(find.text('ABRIR GUIA DE ESTUDOS DE PM-PE'), findsOneWidget);

      // Navegação inferior
      expect(find.text('Meu Painel'), findsWidgets);
      expect(find.text('Guia/Cursos'), findsOneWidget);
      expect(find.text('Questões'), findsOneWidget);
      expect(find.text('Simulado'), findsOneWidget);
    });
  });
}
