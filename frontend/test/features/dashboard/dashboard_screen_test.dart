import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/features/dashboard/presentation/screens/dashboard_screen.dart';

void main() {
  Widget createWidgetUnderTest({
    String userName = 'Rudson Americo',
    String concursoAlvo = 'PC-PE (Agente)',
  }) {
    return MaterialApp(
      home: DashboardScreen(
        userName: userName,
        concursoAlvo: concursoAlvo,
      ),
    );
  }

  group('DashboardScreen (Meu Painel) - Widget Tests', () {
    testWidgets('Renderiza Header CRAVOU, Saudacao e Concurso Alvo', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Valida logo Coruja no AppBar
      expect(find.byType(TacticalOwlLogo), findsOneWidget);

      // Valida saudação ao aluno
      expect(find.textContaining('Olá, Rudson'), findsOneWidget);
      expect(find.textContaining('PC-PE (Agente)'), findsOneWidget);
    });

    testWidgets('Renderiza Métricas de Desempenho e Saldo Líquido Cebraspe', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Métricas
      expect(find.text('RESOLVIDAS'), findsOneWidget);
      expect(find.text('ACERTOS (+1)'), findsOneWidget);
      expect(find.text('ERROS (-1)'), findsOneWidget);
      expect(find.text('LÍQUIDA (C-E)'), findsOneWidget);
    });

    testWidgets('Renderiza Concursos de PE em Destaque e Navegação Inferior', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Concursos de PE
      expect(find.text('PC-PE'), findsWidgets);
      expect(find.text('PM-PE'), findsOneWidget);
      expect(find.text('PP-PE'), findsOneWidget);

      // Navegação inferior
      expect(find.text('Meu Painel'), findsWidgets);
      expect(find.text('Questões'), findsOneWidget);
      expect(find.text('Simulado'), findsOneWidget);
    });
  });
}
