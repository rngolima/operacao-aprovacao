import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';

/// Data Source Remoto responsavel pelas chamadas HTTP de Autenticacao.
class AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  /// Executa o login na API REST
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _apiClient.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    final responseData = response.data as Map<String, dynamic>;
    return LoginResponse.fromJson(responseData);
  }

  /// Executa o cadastro na API REST
  Future<LoginResponse> register(RegisterRequest request) async {
    final response = await _apiClient.post(
      ApiEndpoints.register,
      data: request.toJson(),
    );

    final responseData = response.data as Map<String, dynamic>;
    return LoginResponse.fromJson(responseData);
  }
}
