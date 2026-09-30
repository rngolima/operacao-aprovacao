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
      expect(find.textContaining('PC-PE'), findsWidgets);
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

    testWidgets('Renderiza Meta de Hoje, Concurso Alvo Único e Navegação Inferior', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Card Meta de Hoje
      expect(find.textContaining('META DE HOJE'), findsOneWidget);

      // Concurso Alvo Único (foco 100%, sem poluir com outros certames)
      expect(find.text('SEU CONCURSO ALVO (FOCO 100%)'), findsOneWidget);
      expect(find.text('SIMULADO DO ALVO'), findsOneWidget);

      // Navegação inferior
      expect(find.text('Meu Painel'), findsWidgets);
      expect(find.text('Guia/Cursos'), findsOneWidget);
      expect(find.text('Questões'), findsOneWidget);
      expect(find.text('Simulado'), findsOneWidget);
    });
  });
}
