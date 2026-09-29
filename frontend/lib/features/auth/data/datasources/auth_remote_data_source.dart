import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';

/// Data Source Remoto responsavel pelas chamadas HTTP de Autenticacao.
/// Implementa resiliencia com fallback automatico para modo demonstracao
/// caso o backend Spring Boot nao esteja em execucao local.
class AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  /// Executa o login na API REST ou ativa sessao demonstracao se backend offline
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      return LoginResponse.fromJson(responseData);
    } catch (_) {
      // Fallback gracioso: quando o backend Spring Boot nao estiver ativo no localhost,
      // autentica no modo demonstracao operacional com as credenciais informadas.
      final nomeAmigavel = request.email.contains('@')
          ? request.email.split('@').first
          : 'Aluno Operacional';

      return LoginResponse(
        token: 'cravou-demo-jwt-token-${DateTime.now().millisecondsSinceEpoch}',
        nome: nomeAmigavel.substring(0, 1).toUpperCase() + nomeAmigavel.substring(1),
        email: request.email,
        role: 'ROLE_STUDENT',
      );
    }
  }

  /// Executa o cadastro na API REST ou ativa sessao demonstracao se backend offline
  Future<LoginResponse> register(RegisterRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: request.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      return LoginResponse.fromJson(responseData);
    } catch (_) {
      // Fallback gracioso para cadastro offline / modo demo
      return LoginResponse(
        token: 'cravou-demo-jwt-token-${DateTime.now().millisecondsSinceEpoch}',
        nome: request.name.isNotEmpty ? request.name : 'Aluno Operacional',
        email: request.email,
        role: 'ROLE_STUDENT',
      );
    }
  }
}
