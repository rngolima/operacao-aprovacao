import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';

/// Implementacao Concreta do Repositorio de Autenticacao.
/// Coordena o consumo remoto e o armazenamento seguro de credenciais JWT.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService storageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.storageService,
  });

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await remoteDataSource.login(request);
    
    // Salva o token JWT com criptografia nativa no dispositivo
    if (response.token.isNotEmpty) {
      await storageService.saveToken(response.token);
      await storageService.saveUserData(
        email: response.email,
        role: response.role,
      );
    }
    
    return response;
  }

  @override
  Future<LoginResponse> register(RegisterRequest request) async {
    final response = await remoteDataSource.register(request);
    
    // Se o backend ja emitir token no cadastro, persistimos de imediato
    if (response.token.isNotEmpty) {
      await storageService.saveToken(response.token);
      await storageService.saveUserData(
        email: response.email,
        role: response.role,
        targetConcurso: request.targetCargo,
      );
    }
    
    return response;
  }

  @override
  Future<void> logout() async {
    await storageService.clearSession();
  }

  @override
  Future<bool> checkAuthStatus() async {
    return await storageService.isAuthenticated();
  }

  @override
  Future<String?> getCurrentUserEmail() async {
    return await storageService.getUserEmail();
  }
}
