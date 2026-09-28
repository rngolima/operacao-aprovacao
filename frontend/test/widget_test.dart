import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/widgets/cravou_brand_header.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/main.dart';

void main() {
  testWidgets('Valida inicializacao do App na tela de Login do CRAVOU', (WidgetTester tester) async {
    await tester.pumpWidget(const OperacaoAprovacaoApp());
    await tester.pumpAndSettle();

    // Valida presenca do Header da marca Cravou e da Coruja
    expect(find.byType(CravouBrandHeader), findsOneWidget);
    expect(find.byType(TacticalOwlLogo), findsOneWidget);

    // Valida a presenca do botao tatico de acesso ao cockpit do Cravou
    expect(find.text('[ ENTRAR NO CRAVOU ]'), findsOneWidget);
  });
}
