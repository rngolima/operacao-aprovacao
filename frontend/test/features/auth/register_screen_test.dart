import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/core/state/plano_estudo_state.dart';
import 'package:operacao_aprovacao_app/features/auth/presentation/screens/register_screen.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: RegisterScreen(),
    );
  }

  group('RegisterScreen (Alistamento de Candidato) - Widget Tests', () {
    testWidgets('Renderiza Logo Heroica, CRAVOU e Alerta de Edital da PM-PE', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Logo Heroica
      expect(find.byType(TacticalOwlLogo), findsOneWidget);

      // Marca CRAVOU
      expect(find.text('CRAVOU'), findsNothing); // Usa RichText
      expect(find.text('Alistamento de Candidato'), findsOneWidget);

      // Alerta de Edital na Praça da PM-PE
      expect(find.text('EDITAL NA PRAÇA!'), findsOneWidget);
      expect(find.text('🚨 EDITAL NOVO'), findsOneWidget);
      expect(find.text('PM-PE'), findsOneWidget);
      expect(find.text('Polícia Militar'), findsOneWidget);

      // Cargo padrão da PM-PE
      expect(find.text('Soldado da PM'), findsOneWidget);
    });

    testWidgets('Conclui alistamento e atualiza PlanoEstudoState para PM-PE', (tester) async {
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

      final btnFinder = find.text('ALISTAR-SE NO CURSO DE PM-PE');
      await tester.ensureVisible(btnFinder);
      await tester.pumpAndSettle();

      // Toca em Concluir Alistamento
      await tester.tap(btnFinder);
      await tester.pumpAndSettle();

      // Valida que o PlanoEstudoState foi atualizado para PM-PE
      expect(PlanoEstudoState.instance.concursoAlvo.contains('PM-PE'), isTrue);
      expect(PlanoEstudoState.instance.cargoAlvo, equals('Soldado da PM'));
    });
  });
}
