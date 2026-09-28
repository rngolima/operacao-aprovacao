import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../data/models/register_request.dart';

/// Contrato Abstrato do Repositorio de Autenticacao.
/// Desacopla a camada de apresentacao da implementacao HTTP concreta.
abstract class AuthRepository {
  /// Realiza login com e-mail e senha.
  Future<LoginResponse> login(LoginRequest request);

  /// Registra novo aluno no sistema.
  Future<LoginResponse> register(RegisterRequest request);

  /// Finaliza a sessao do usuario ativo.
  Future<void> logout();

  /// Verifica se o usuario atual possui token JWT valido.
  Future<bool> checkAuthStatus();

  /// Retorna o e-mail do usuario logado.
  Future<String?> getCurrentUserEmail();
}
