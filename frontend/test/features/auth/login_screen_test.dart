import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/cravou_brand_header.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/features/auth/presentation/screens/login_screen.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }

  group('LoginScreen & Identidade CRAVOU - Widget Tests', () {
    testWidgets('Renderiza elementos da Marca Oficial: Coruja Heroica, CRAVOU e Titulo', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Valida o header da marca CRAVOU
      expect(find.byType(CravouBrandHeader), findsOneWidget);
      expect(find.byType(TacticalOwlLogo), findsOneWidget);

      // Valida o subtitulo e a pill institucional
      expect(find.text('Treinador Tático de Concursos'), findsOneWidget);
      expect(find.text('Simulados & Questões de Alta Performance'), findsOneWidget);

      // Valida os campos de entrada e botao com nova identidade
      expect(find.text('E-mail ou Matrícula'), findsOneWidget);
      expect(find.text('Senha de Acesso'), findsOneWidget);
      expect(find.text('ENTRAR'), findsOneWidget);
      expect(find.text('Criar Conta Grátis'), findsOneWidget);
    });

    testWidgets('Dispara mensagens de validacao quando campos estao em branco', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Clica em ENTRAR com campos vazios
      final submitButton = find.text('ENTRAR');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      // Verifica exibicao das mensagens de validacao
      expect(find.text('Informe o e-mail cadastrado.'), findsOneWidget);
      expect(find.text('Informe sua senha de acesso.'), findsOneWidget);
    });
  });
}
