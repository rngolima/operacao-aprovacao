import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/main.dart';

void main() {
  testWidgets('Valida inicializacao do App na tela de Login com a Coruja Oficial', (WidgetTester tester) async {
    await tester.pumpWidget(const OperacaoAprovacaoApp());
    await tester.pumpAndSettle();

    // Valida que o titulo oficial esta visivel
    expect(find.text('OPERAÇÃO APROVAÇÃO'), findsOneWidget);

    // Valida que a logo da coruja foi renderizada
    expect(find.byType(TacticalOwlLogo), findsOneWidget);

    // Valida a presenca do botao tatico de acesso ao cockpit
    expect(find.text('[ ACESSAR COCKPIT ]'), findsOneWidget);
  });
}
