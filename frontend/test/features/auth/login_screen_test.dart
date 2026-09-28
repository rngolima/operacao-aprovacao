import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/co_branding_header.dart';
import 'package:operacao_aprovacao_app/core/widgets/pcpe_badge.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/features/auth/presentation/screens/login_screen.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }

  group('LoginScreen & Identidade Visual Aprovada - Widget Tests', () {
    testWidgets('Renderiza elementos da Marca Oficial: Coruja Tatica, Brasao PC-PE e Titulo', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Valida o header de co-branding
      expect(find.byType(CoBrandingHeader), findsOneWidget);
      expect(find.byType(TacticalOwlLogo), findsOneWidget);
      expect(find.byType(PcpeBadge), findsOneWidget);
      expect(find.text('✕'), findsOneWidget);

      // Valida os titulos institucionais
      expect(find.text('OPERAÇÃO APROVAÇÃO'), findsOneWidget);
      expect(find.text('Plataforma Tática de Simulação • Edital PC-PE'), findsOneWidget);

      // Valida os campos de entrada e botao
      expect(find.text('E-mail Operacional'), findsOneWidget);
      expect(find.text('Senha de Acesso'), findsOneWidget);
      expect(find.text('[ ACESSAR COCKPIT ]'), findsOneWidget);
      expect(find.text('Criar Conta Operacional'), findsOneWidget);
    });

    testWidgets('Dispara mensagens de validacao quando campos estao em branco', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Clica em [ ACESSAR COCKPIT ] com campos vazios
      final submitButton = find.text('[ ACESSAR COCKPIT ]');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      // Verifica exibicao das mensagens de validacao
      expect(find.text('Informe o e-mail cadastrado.'), findsOneWidget);
      expect(find.text('Informe sua senha de acesso.'), findsOneWidget);
    });
  });
}
