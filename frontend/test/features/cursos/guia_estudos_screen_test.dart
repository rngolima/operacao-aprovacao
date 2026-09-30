import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/state/plano_estudo_state.dart';
import 'package:operacao_aprovacao_app/features/cursos/presentation/screens/guia_estudos_screen.dart';

void main() {
  Widget createWidgetUnderTest({List<String>? disciplinasFoco}) {
    return MaterialApp(
      home: GuiaEstudosScreen(
        concursoNome: 'PM-PE (Polícia Militar de Pernambuco)',
        disciplinasFoco: disciplinasFoco,
      ),
    );
  }

  group('GuiaEstudosScreen (Conteúdo Programático PM-PE & Dificuldades) - Widget Tests', () {
    setUp(() {
      final plano = PlanoEstudoState.instance;
      plano.atualizarPlano(
        concursoAlvo: 'PM-PE (Polícia Militar de Pernambuco)',
        cargoAlvo: 'Soldado da Polícia Militar',
        banca: 'Instituto AOCP',
        horasPorDia: 3,
        semanasAteProva: 21,
        disciplinas: const [
          'Língua Portuguesa (10 questões)',
          'História de Pernambuco (10 questões)',
          'Raciocínio Lógico Matemático (10 questões)',
          'Noções de Informática (10 questões)',
          'Direito Constitucional (10 questões)',
          'Direitos Humanos e Legislação Extravagante (10 questões)',
          'Prova Discursiva (Redação - 40 pontos)',
        ],
      );
      plano.setMateriasDificuldade({
        'Raciocínio Lógico Matemático',
        'Direito Constitucional',
      });
    });

    testWidgets('Renderiza Header, Curso Oficial PM-PE e Barra de Progresso', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Guia de Estudos do Edital'), findsOneWidget);
      expect(find.textContaining('PM-PE — Soldado da Polícia Militar • AOCP'), findsOneWidget);
      expect(find.text('Conteúdo Programático Oficial PM-PE'), findsOneWidget);
      expect(find.textContaining('Banca Instituto AOCP • 1.250 Vagas Soldado'), findsOneWidget);
      expect(find.text('Progresso Global do Edital'), findsOneWidget);
    });

    testWidgets('Renderiza Card de Inteligência de Dificuldades e badges de prioridade tática', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Card de inteligência
      expect(find.text('INTELIGÊNCIA DE DIFICULDADES CRAVOU'), findsOneWidget);
      expect(find.text('AJUSTAR DIFICULDADES'), findsOneWidget);
      expect(find.text('⭐ Priorizar Minhas Dificuldades'), findsOneWidget);
      expect(find.text('Ordem do Edital'), findsOneWidget);

      // Badge de dificuldade nas matérias marcadas
      expect(find.textContaining('PRIORIDADE TÁTICA • SUA MAIOR DIFICULDADE'), findsWidgets);
    });

    testWidgets('Abre modal de ajuste de dificuldades e permite alternar matérias', (tester) async {
      tester.view.physicalSize = const Size(800, 1800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Clica em Ajustar Dificuldades
      final btnAjustar = find.text('AJUSTAR DIFICULDADES');
      await tester.ensureVisible(btnAjustar);
      await tester.tap(btnAjustar);
      await tester.pumpAndSettle();

      // Modal aberto
      expect(find.text('Minhas Maiores Dificuldades'), findsOneWidget);
      expect(find.text('APLICAR PRIORIDADES TÁTICAS'), findsOneWidget);

      // Clica no botão para fechar o modal
      await tester.tap(find.text('APLICAR PRIORIDADES TÁTICAS'));
      await tester.pumpAndSettle();

      expect(find.text('Minhas Maiores Dificuldades'), findsNothing);
    });
  });
}
