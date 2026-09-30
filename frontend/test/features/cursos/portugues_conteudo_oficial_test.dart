import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/cursos/data/datasources/portugues/portugues_conteudo_oficial.dart';
import 'package:operacao_aprovacao_app/features/cursos/presentation/screens/aula_detalhe_screen.dart';

void main() {
  group('Língua Portuguesa - Acervo Oficial CRAVOU Tests', () {
    test('Valida que existem exatamente 8 aulas oficiais cobrindo o edital', () {
      expect(PortuguesConteudoOficial.aulas.length, 8);
    });

    test('Valida que cada uma das 8 aulas possui no mínimo 15 questões comentadas (Total 120 questões)', () {
      final todas = PortuguesConteudoOficial.todasAsQuestoes;
      expect(todas.length, 120);

      for (int i = 0; i < PortuguesConteudoOficial.aulas.length; i++) {
        final aula = PortuguesConteudoOficial.aulas[i];
        expect(aula.questoes, isNotNull);
        expect(aula.questoes!.length, greaterThanOrEqualTo(15),
            reason: 'Aula ${aula.numero} (${aula.titulo}) deve ter no mínimo 15 questões.');

        // Valida que cada questão possui gabarito e comentário didático CRAVOU
        for (final q in aula.questoes!) {
          expect(q.gabaritoOficial.isNotEmpty, isTrue);
          expect(q.comentarioDidatico.isNotEmpty, isTrue);
          expect(q.comentarioDidatico.contains('CRAVOU'), isTrue,
              reason: 'Questão ${q.id} deve conter comentário pedagógico autoral CRAVOU.');
        }
      }
    });

    test('Valida que todas as 8 aulas possuem Mapa Mental Tático estruturado', () {
      for (final aula in PortuguesConteudoOficial.aulas) {
        expect(aula.mapaMental, isNotNull,
            reason: 'Aula ${aula.numero} deve ter Mapa Mental.');
        final mapa = aula.mapaMental!;
        expect(mapa.conceitoCentral.isNotEmpty, isTrue);
        expect(mapa.regraDeOuro.isNotEmpty, isTrue);
        expect(mapa.ramos.length, greaterThanOrEqualTo(4),
            reason: 'Aula ${aula.numero} deve ter no mínimo 4 ramos estruturados.');
      }
    });
  });

  group('AulaDetalheScreen - 3 Abas Táticas (Resumo, Mapa Mental e Questões) Widget Tests', () {
    testWidgets('Renderiza as 3 abas na AppBar e navega entre Resumo, Mapa Mental e Questões', (tester) async {
      final aula01 = PortuguesConteudoOficial.aulas[0];

      await tester.pumpWidget(
        MaterialApp(
          home: AulaDetalheScreen(
            disciplina: 'Língua Portuguesa',
            tituloAula: aula01.titulo,
            questoesVinculadas: aula01.questoes!,
            conteudoTeorico: aula01.conteudoTeorico,
            mapaMental: aula01.mapaMental,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Valida a presença das 3 abas
      expect(find.text('Resumo'), findsOneWidget);
      expect(find.text('Mapa Mental'), findsOneWidget);
      expect(find.text('Questões (15)'), findsOneWidget);

      // 2. Aba 1: Resumo está visível
      expect(find.text('METODOLOGIA TÁTICA CRAVOU'), findsOneWidget);
      expect(find.text('100% Autoral'), findsOneWidget);

      // 3. Toca na Aba "Mapa Mental"
      await tester.tap(find.text('Mapa Mental'));
      await tester.pumpAndSettle();

      // Valida elementos do Mapa Mental Tático
      expect(find.text('CONCEITO CENTRAL DO MAPA'), findsOneWidget);
      expect(find.text('REGRA DE OURO DA BANCA'), findsOneWidget);
      expect(find.textContaining('Leitura Tática de Textos'), findsOneWidget);

      // 4. Toca na Aba "Questões (15)"
      await tester.tap(find.text('Questões (15)'));
      await tester.pumpAndSettle();

      // Valida o placar de telemetria da aula
      expect(find.text('TOTAL'), findsOneWidget);
      expect(find.text('15'), findsWidgets);
      expect(find.text('RESPONDIDAS'), findsOneWidget);
      expect(find.text('ACERTOS'), findsOneWidget);
      expect(find.text('ERROS'), findsOneWidget);
      expect(find.text('APROVEIT.'), findsOneWidget);
    });
  });
}
