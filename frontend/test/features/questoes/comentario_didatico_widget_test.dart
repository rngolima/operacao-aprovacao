import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/questoes/presentation/widgets/comentario_didatico_widget.dart';

void main() {
  group('ComentarioDidaticoWidget - Testes Estruturais e Visuais de Resolução Didática', () {
    const comentarioExemplo = '''🎯 CRAVOU NO GABARITO OFICIAL: B (Narrativo)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A dissertação argumentativa exige tese e dados.
• B) CORRETA. O trecho estrutura-se essencialmente na progressão temporal de ações.
• C) INCORRETA. O texto injuntivo prescreve regras.
• D) INCORRETA. O texto contém elementos descritivos secundários.
• E) INCORRETA. O texto expositivo objetiva informar dados neutros.

💡 O PULO DO GATO / PEGADINHA DA AOCP:
A banca adora colocar adjetivos para confundir com descritivo. Linha do tempo em movimento = Narrativa!''';

    testWidgets('Renderiza Header de Acerto com Gabarito Oficial e Fundamento', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: ComentarioDidaticoWidget(
                comentario: comentarioExemplo,
                gabaritoOficial: 'B',
                acertou: true,
                assunto: 'Tipologia Textual',
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // Valida Status CRAVOU e Letra do Gabarito
      expect(find.text('CRAVOU! RESPOSTA CERTA'), findsOneWidget);
      expect(find.text('Gabarito: '), findsOneWidget);
      expect(find.text('B'), findsWidgets);

      // Valida Seção de Alternativas Destrinchadas
      expect(find.text('ANÁLISE DESTRINCHADA DAS ALTERNATIVAS:'), findsOneWidget);
      expect(find.text('✓ ALTERNATIVA CORRETA'), findsOneWidget);
      expect(find.text('✗ DISTRATOR / INCORRETA'), findsNWidgets(4));

      // Valida Caixa Dourada de Pegadinha da Banca
      expect(find.text('O PULO DO GATO • PEGADINHA DA BANCA'), findsOneWidget);
      expect(find.textContaining('Linha do tempo em movimento = Narrativa!'), findsOneWidget);

      // Valida Card do Professor CRAVOU AI no final da resposta certa
      expect(find.text('Professor CRAVOU AI'), findsOneWidget);
      expect(find.text('TIRAR DÚVIDA / PEDIR MNEMÔNICO'), findsOneWidget);
    });

    testWidgets('Exibe Ponto de Vulnerabilidade quando o aluno erra e dispara callback de revisão', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      bool revisaoClicada = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: ComentarioDidaticoWidget(
                comentario: comentarioExemplo,
                gabaritoOficial: 'B',
                acertou: false,
                assunto: 'Tipologia Textual',
                onRevisarAssunto: () => revisaoClicada = true,
                tempoGastoSegundos: 165,
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // Valida Status de Resposta Incorreta
      expect(find.text('RESPOSTA INCORRETA'), findsOneWidget);

      // Valida Alerta de Tempo Tático Alto (> 150s)
      expect(find.textContaining('Atenção ao tempo gasto (2m45s)'), findsOneWidget);

      // Valida Ponto de Vulnerabilidade
      expect(find.text('PONTO DE VULNERABILIDADE DETECTADO'), findsOneWidget);
      expect(find.text('Revisar "Tipologia Textual" no Resumo e Mapa Mental'), findsOneWidget);

      // Valida Card do Professor CRAVOU AI no final da resposta errada
      expect(find.text('Professor CRAVOU AI'), findsOneWidget);
      expect(find.text('DESVENDAR PEGADINHA COM O PROFESSOR'), findsOneWidget);

      // Clica para revisar
      final btnRevisar = find.text('PONTO DE VULNERABILIDADE DETECTADO');
      await tester.ensureVisible(btnRevisar);
      await tester.tap(btnRevisar);
      await tester.pump();

      expect(revisaoClicada, isTrue);
    });
  });
}
