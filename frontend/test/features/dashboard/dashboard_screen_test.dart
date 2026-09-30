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
    });

    testWidgets('Renderiza Banner Heroico de Contagem Regressiva e Header Limpo (Foguinho 12 dias e Foco PM-PE)', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Valida logo Coruja e Iniciais no AppBar
      expect(find.byType(TacticalOwlLogo), findsOneWidget);
      expect(find.text('RL'), findsOneWidget);

      // Pílula com o foguinho e sequência de guerra integrada no banner heroico
      expect(find.text('12 dias seguidos'), findsOneWidget);
      expect(find.text('🔥'), findsWidgets);

      // Botão "Planejamento de Estudos" substitui "Adicionar Edital"
      expect(find.text('Planejamento de Estudos'), findsOneWidget);
      expect(find.text('Adicionar Edital'), findsNothing);
      expect(find.text('Adicionar Edital (IA)'), findsNothing);

      // Banner Heroico Aprimorado de Contagem Regressiva para a Prova da PM-PE (144 dias)
      expect(find.textContaining('CONTAGEM REGRESSIVA: 144 DIAS PARA A PROVA DA PM-PE (21/02/2027)'), findsOneWidget);
      expect(find.textContaining('Prova Oficial: 21 de Fevereiro de 2027'), findsOneWidget);
      expect(find.text('VER CRONOGRAMA'), findsOneWidget);

      // Confirma que os cards poluídos foram removidos da tela inicial
      expect(find.textContaining('INSCRIÇÃO HOMOLOGADA • Nº 2026-PMPE-08942'), findsNothing);
    });

    testWidgets('Navega para PlanejadorTaticoScreen com as 21 semanas completas e rigor do edital AOCP', (tester) async {
      tester.view.physicalSize = const Size(800, 1800);
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
      expect(find.text('CRONOGRAMA REGRESSIVO OFICIAL DA PM-PE'), findsOneWidget);
      expect(find.text('Sua Disponibilidade Diária de Estudos'), findsOneWidget);
      expect(find.text('Cronograma da Semana 1 ao Dia da Prova'), findsOneWidget);
      expect(find.text('144 dias'), findsOneWidget);
      expect(find.text('21 SEMANAS'), findsOneWidget);

      // Valida a presença da Semana 1 e da Semana da Prova
      expect(find.textContaining('Semana 1 • Compreensão de Texto'), findsOneWidget);
      expect(find.text('SEMANA ATUAL'), findsOneWidget);

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

    testWidgets('Renderiza Métricas de Desempenho focadas na PM-PE (Instituto AOCP)', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Métricas da PM-PE
      expect(find.text('RESOLVIDAS'), findsOneWidget);
      expect(find.text('ACERTOS (+1)'), findsOneWidget);
      expect(find.text('ERROS (-1)'), findsOneWidget);
      expect(find.text('PONTOS PM-PE'), findsOneWidget);
      expect(find.textContaining('História de Pernambuco (Instituto AOCP)'), findsOneWidget);
    });

    testWidgets('Renderiza Meta de Hoje, Concurso Alvo Único e Guia de Estudos da PM-PE', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Card Meta de Hoje
      expect(find.textContaining('META DE HOJE'), findsOneWidget);
      expect(find.text('ESTUDAR NO GUIA'), findsOneWidget);
      expect(find.textContaining('QUESTÕES DO DIA'), findsOneWidget);

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

    testWidgets('Planejador Tático exibe Mapeamento de Dificuldades e permite selecionar matérias', (tester) async {
      tester.view.physicalSize = const Size(800, 1800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Navega para o Planejador Tático
      await tester.tap(find.text('VER CRONOGRAMA'));
      await tester.pumpAndSettle();

      // Valida card de dificuldades
      expect(find.text('Matérias de Maior Dificuldade'), findsOneWidget);
      expect(find.textContaining('Priorização Tática no Guia de Estudos'), findsOneWidget);
      expect(find.text('Raciocínio Lógico Matemático'), findsWidgets);
      expect(find.text('Direito Constitucional'), findsWidgets);
    });
  });
}
