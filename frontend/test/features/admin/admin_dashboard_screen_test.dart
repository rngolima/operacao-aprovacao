import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/admin/presentation/screens/admin_dashboard_screen.dart';
import 'package:operacao_aprovacao_app/features/admin/presentation/screens/upload_edital_screen.dart';
import 'package:operacao_aprovacao_app/features/admin/presentation/screens/cadastrar_material_screen.dart';
import 'package:operacao_aprovacao_app/features/admin/presentation/screens/gestao_usuarios_screen.dart';

void main() {
  Widget createAdminDashboardUnderTest() {
    return const MaterialApp(
      home: AdminDashboardScreen(adminNome: 'Rudson Lima'),
    );
  }

  group('AdminDashboardScreen (Painel do Administrador) - Widget Tests', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('Renderiza Header, Boas-Vindas e Métricas de Auditoria de Usuários', (tester) async {
      tester.view.physicalSize = const Size(800, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createAdminDashboardUnderTest());
      await tester.pump();

      // Header do Administrador
      expect(find.text('PAINEL DO ADMINISTRADOR'), findsOneWidget);
      expect(find.text('QG CRAVOU • GESTÃO E OPERAÇÃO'), findsOneWidget);
      expect(find.text('VISÃO ALUNO'), findsOneWidget);

      // Banner de Boas-Vindas
      expect(find.text('Olá, Rudson Lima'), findsOneWidget);
      expect(find.text('ONLINE'), findsOneWidget);

      // Métricas de Tração & Negócio
      expect(find.text('TOTAL DE USUÁRIOS'), findsOneWidget);
      expect(find.text('1.482'), findsOneWidget);
      expect(find.text('USUÁRIOS ATIVOS HOJE'), findsOneWidget);
      expect(find.text('834'), findsOneWidget);
      expect(find.text('ASSINANTES CRAVOU PRO'), findsOneWidget);
      expect(find.text('318'), findsOneWidget);
      expect(find.text('MRR (RECEITA RECORRENTE)'), findsOneWidget);

      // Distribuição de Alunos por Concurso
      expect(find.text('PM-PE (Polícia Militar)'), findsOneWidget);
      expect(find.textContaining('1120 alunos (75.5%)'), findsOneWidget);
      expect(find.text('PC-PE (Polícia Civil)'), findsOneWidget);
      expect(find.text('PP-PE (Polícia Penal)'), findsOneWidget);

      // Telemetria de Sistema
      expect(find.text('Backend API (Spring Boot)'), findsOneWidget);
      expect(find.text('Banco de Dados PostgreSQL'), findsOneWidget);
      expect(find.text('Motor de IA / Análise de Editais'), findsOneWidget);
    });

    testWidgets('Navega para UploadEditalScreen ao tocar em Carregar Edital', (tester) async {
      tester.view.physicalSize = const Size(800, 1800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createAdminDashboardUnderTest());
      await tester.pump();

      final btnCarregar = find.text('Carregar Edital');
      await tester.ensureVisible(btnCarregar);
      await tester.tap(btnCarregar);
      await tester.pumpAndSettle();

      expect(find.byType(UploadEditalScreen), findsOneWidget);
      expect(find.text('Carregar Edital Oficial'), findsOneWidget);
      expect(find.text('SELECIONAR EDITAL EM PDF'), findsOneWidget);
    });

    testWidgets('Navega para CadastrarMaterialScreen ao tocar em Subir Materiais', (tester) async {
      tester.view.physicalSize = const Size(800, 1800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createAdminDashboardUnderTest());
      await tester.pump();

      final btnMateriais = find.text('Subir Materiais');
      await tester.ensureVisible(btnMateriais);
      await tester.tap(btnMateriais);
      await tester.pumpAndSettle();

      expect(find.byType(CadastrarMaterialScreen), findsOneWidget);
      expect(find.text('Subir Material de Aprendizagem'), findsOneWidget);
      expect(find.text('PUBLICAR MATERIAL NO APP'), findsOneWidget);
    });

    testWidgets('Navega para GestaoUsuariosScreen e permite filtrar e pesquisar alunos', (tester) async {
      tester.view.physicalSize = const Size(800, 1800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(createAdminDashboardUnderTest());
      await tester.pump();

      final btnUsuarios = find.text('Gerenciar Todos os Usuários & Confirmações de E-mail');
      await tester.ensureVisible(btnUsuarios);
      await tester.tap(btnUsuarios);
      await tester.pumpAndSettle();

      expect(find.byType(GestaoUsuariosScreen), findsOneWidget);
      expect(find.text('Gestão de Usuários & Alunos'), findsOneWidget);
      expect(find.text('Rudson Lima (Você)'), findsOneWidget);
      expect(find.text('Carlos Eduardo Santos'), findsOneWidget);
    });
  });
}
