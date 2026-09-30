import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/core/state/plano_estudo_state.dart';
import 'package:operacao_aprovacao_app/features/dashboard/presentation/screens/dashboard_screen.dart';

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

      // Botão "Adicionar Edital" sem o sufixo "(IA)"
      expect(find.text('Adicionar Edital'), findsOneWidget);
      expect(find.text('Adicionar Edital (IA)'), findsNothing);

      // Banner de Contagem Regressiva para a Prova da PM-PE
      expect(find.textContaining('CONTAGEM REGRESSIVA: 68 DIAS PARA A PROVA DA PM-PE'), findsOneWidget);
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
