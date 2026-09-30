import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/core/state/plano_estudo_state.dart';
import 'package:operacao_aprovacao_app/features/auth/presentation/screens/register_screen.dart';
import 'package:operacao_aprovacao_app/features/auth/presentation/screens/validacao_email_screen.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: RegisterScreen(),
    );
  }

  group('RegisterScreen (Alistamento de Candidato & LGPD) - Widget Tests', () {
    testWidgets('Renderiza Logo Heroica, Alerta de Edital da PM-PE e Termo LGPD', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Logo Heroica
      expect(find.byType(TacticalOwlLogo), findsOneWidget);

      // Alistamento de Candidato
      expect(find.text('Alistamento de Candidato'), findsOneWidget);

      // Alerta de Edital na Praça da PM-PE
      expect(find.text('EDITAL NA PRAÇA!'), findsOneWidget);
      expect(find.text('🚨 EDITAL NOVO'), findsOneWidget);
      expect(find.text('PM-PE'), findsOneWidget);
      expect(find.text('Polícia Militar'), findsOneWidget);

      // Cargo padrão da PM-PE
      expect(find.text('Soldado da PM'), findsOneWidget);

      // Checkbox de Consentimento LGPD
      expect(find.byKey(const Key('checkbox_lgpd')), findsOneWidget);
      expect(find.textContaining('LGPD - Lei 13.709/18'), findsOneWidget);
    });

    testWidgets('Bloqueia alistamento se não consentir com a LGPD', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Preenche os campos obrigatórios
      await tester.enterText(find.byType(TextFormField).at(0), 'Rudson Americo');
      await tester.enterText(find.byType(TextFormField).at(1), 'rudson@cravou.com.br');
      await tester.enterText(find.byType(TextFormField).at(2), '123456');

      final btnFinder = find.text('ALISTAR-SE NO CURSO DE PM-PE');
      await tester.ensureVisible(btnFinder);
      await tester.pumpAndSettle();

      // Tenta submeter sem marcar o checkbox da LGPD
      await tester.tap(btnFinder);
      await tester.pumpAndSettle();

      // Verifica que exibiu alerta obrigatório da LGPD e não mudou de tela
      expect(find.text('⚠️ O consentimento da LGPD é obrigatório para prosseguir.'), findsOneWidget);
      expect(find.byType(ValidacaoEmailScreen), findsNothing);
    });

    testWidgets('Avança para ValidacaoEmailScreen e libera acesso após confirmar código', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Preenche os campos
      await tester.enterText(find.byType(TextFormField).at(0), 'Rudson Americo');
      await tester.enterText(find.byType(TextFormField).at(1), 'rudson@cravou.com.br');
      await tester.enterText(find.byType(TextFormField).at(2), '123456');

      // Marca o consentimento LGPD
      final lgpdCheckboxFinder = find.byKey(const Key('checkbox_lgpd'));
      await tester.ensureVisible(lgpdCheckboxFinder);
      await tester.tap(lgpdCheckboxFinder);
      await tester.pumpAndSettle();

      // Toca em Concluir Alistamento
      final btnFinder = find.text('ALISTAR-SE NO CURSO DE PM-PE');
      await tester.ensureVisible(btnFinder);
      await tester.tap(btnFinder);
      await tester.pumpAndSettle();

      // Valida que foi para a tela de Validação de E-mail
      expect(find.byType(ValidacaoEmailScreen), findsOneWidget);
      expect(find.text('Confirmação de Inscrição'), findsOneWidget);
      expect(find.text('rudson@cravou.com.br'), findsOneWidget);

      // Usa o atalho didático de preencher código automático recebido no e-mail
      await tester.tap(find.text('Preencher código automaticamente'));
      await tester.pumpAndSettle();

      // Toca em Confirmar e Liberar Meu Acesso
      final btnConfirmar = find.text('CONFIRMAR E LIBERAR MEU ACESSO');
      await tester.ensureVisible(btnConfirmar);
      await tester.tap(btnConfirmar);
      await tester.pump(const Duration(milliseconds: 700));
      await tester.pumpAndSettle();

      // Valida diálogo de sucesso LGPD
      expect(find.text('Inscrição Validada!'), findsOneWidget);
      expect(find.text('ACESSAR MEU PAINEL DE ESTUDOS'), findsOneWidget);

      // Clica para acessar o painel
      await tester.tap(find.text('ACESSAR MEU PAINEL DE ESTUDOS'));
      await tester.pumpAndSettle();

      // Valida que o PlanoEstudoState foi atualizado para PM-PE
      expect(PlanoEstudoState.instance.concursoAlvo.contains('PM-PE'), isTrue);
      expect(PlanoEstudoState.instance.cargoAlvo, equals('Soldado da PM'));
    });
  });
}
