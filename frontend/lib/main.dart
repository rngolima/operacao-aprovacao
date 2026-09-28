import 'package:flutter/material.dart';
import 'core/network/api_client.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/presentation/controllers/auth_controller.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/questoes/data/datasources/questoes_remote_data_source.dart';
import 'features/questoes/data/repositories/questoes_repository_impl.dart';
import 'features/questoes/presentation/controllers/questoes_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Camada de Infraestrutura Core
  final storageService = SecureStorageService();
  final apiClient = ApiClient(storageService: storageService);

  // 2. Modulo de Autenticacao
  final authRemoteDataSource = AuthRemoteDataSource(apiClient);
  final authRepository = AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSource,
    storageService: storageService,
  );
  final authController = AuthController(authRepository);

  // 3. Modulo de Banco de Questoes & Treino Cebraspe PC-PE
  final questoesRemoteDataSource = QuestoesRemoteDataSource(apiClient: apiClient);
  final questoesRepository = QuestoesRepositoryImpl(remoteDataSource: questoesRemoteDataSource);
  final questoesController = QuestoesController(questoesRepository);

  runApp(OperacaoAprovacaoApp(
    authController: authController,
    questoesController: questoesController,
  ));
}

class OperacaoAprovacaoApp extends StatelessWidget {
  final AuthController? authController;
  final QuestoesController? questoesController;

  const OperacaoAprovacaoApp({
    super.key,
    this.authController,
    this.questoesController,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cravou - Treinador Tático de Concursos',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      home: LoginScreen(
        controller: authController,
        questoesController: questoesController,
      ),
    );
  }
}
