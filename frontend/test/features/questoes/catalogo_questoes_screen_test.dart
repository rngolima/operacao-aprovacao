import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/network/api_client.dart';
import 'package:operacao_aprovacao_app/core/widgets/pcpe_badge.dart';
import 'package:operacao_aprovacao_app/core/widgets/tactical_owl_logo.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/datasources/questoes_remote_data_source.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/repositories/questoes_repository_impl.dart';
import 'package:operacao_aprovacao_app/features/questoes/presentation/controllers/questoes_controller.dart';
import 'package:operacao_aprovacao_app/features/questoes/presentation/screens/catalogo_questoes_screen.dart';

void main() {
  late QuestoesController controller;

  setUp(() async {
    final remoteDataSource = QuestoesRemoteDataSource(apiClient: ApiClient());
    final repository = QuestoesRepositoryImpl(remoteDataSource: remoteDataSource);
    controller = QuestoesController(repository);
    await controller.inicializar();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: CatalogoQuestoesScreen(controller: controller),
    );
  }

  group('CatalogoQuestoesScreen & Treino Cebraspe - Widget Tests', () {
    testWidgets('Renderiza Co-Branding CRAVOU x PC-PE e barra de telemetria', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Valida Co-Branding no AppBar
      expect(find.byType(TacticalOwlLogo), findsWidgets);
      expect(find.byType(PcpeBadge), findsWidgets);
      expect(find.text('✕'), findsOneWidget);

      // Valida métricas do treino
      expect(find.text('ACERTOS'), findsOneWidget);
      expect(find.text('ERROS'), findsOneWidget);
      expect(find.text('APROVEITAMENTO'), findsOneWidget);

      // Valida que ao menos uma questao do Cebraspe esta renderizada
      expect(find.text('[ CERTO ]'), findsWidgets);
      expect(find.text('[ ERRADO ]'), findsWidgets);
    });

    testWidgets('Responde questao e revela fundamentacao didatica do CRAVOU', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Clica no primeiro botao [ ERRADO ]
      final firstErradoBtn = find.text('[ ERRADO ]').first;
      await tester.tap(firstErradoBtn);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      // Verifica que a justificativa didatica oficial foi revelada na tela
      expect(find.textContaining('CRAVOU'), findsWidgets);
    });
  });
}
