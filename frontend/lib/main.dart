import 'package:flutter/material.dart';
import 'core/network/api_client.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/presentation/controllers/auth_controller.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Injecao de Dependencias da Camada de Rede e Seguranca
  final storageService = SecureStorageService();
  final apiClient = ApiClient(storageService: storageService);
  final authRemoteDataSource = AuthRemoteDataSource(apiClient);
  final authRepository = AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSource,
    storageService: storageService,
  );
  final authController = AuthController(authRepository);

  runApp(OperacaoAprovacaoApp(authController: authController));
}

class OperacaoAprovacaoApp extends StatelessWidget {
  final AuthController? authController;

  const OperacaoAprovacaoApp({
    super.key,
    this.authController,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operação Aprovação - PC-PE',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      home: LoginScreen(controller: authController),
    );
  }
}
