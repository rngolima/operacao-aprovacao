import 'package:flutter/foundation.dart';
import '../../../../core/network/api_exception.dart';
import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../data/models/register_request.dart';
import '../../domain/repositories/auth_repository.dart';

enum AuthStatus { unauthenticated, authenticating, authenticated, error }

/// Controller de Autenticacao baseado em ChangeNotifier.
/// Gerencia o fluxo de login, cadastro, logout e estados de carregamento.
class AuthController extends ChangeNotifier {
  final AuthRepository _repository;

  AuthStatus _status = AuthStatus.unauthenticated;
  String? _errorMessage;
  LoginResponse? _currentUser;

  AuthController(this._repository);

  AuthStatus get status => _status;
  bool get isLoading => _status == AuthStatus.authenticating;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  String? get errorMessage => _errorMessage;
  LoginResponse? get currentUser => _currentUser;

  /// Inicializa verificando se ha token salvo
  Future<void> checkInitialAuth() async {
    final hasToken = await _repository.checkAuthStatus();
    if (hasToken) {
      final email = await _repository.getCurrentUserEmail();
      _status = AuthStatus.authenticated;
      _currentUser = LoginResponse(
        token: '',
        nome: 'Aluno Operacional',
        email: email ?? '',
        role: 'ROLE_STUDENT',
      );
      notifyListeners();
    }
  }

  /// Executa autenticacao com e-mail e senha
  Future<bool> login(String email, String password) async {
    _status = AuthStatus.authenticating;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.login(
        LoginRequest(email: email, password: password),
      );
      _currentUser = response;
      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } on ApiException catch (e) {
      _errorMessage = e.message;
      _status = AuthStatus.error;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Falha inesperada ao tentar efetuar login.';
      _status = AuthStatus.error;
      notifyListeners();
      return false;
    }
  }

  /// Executa cadastro de novo aluno operacional
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    String targetCargo = 'Agente de Polícia',
  }) async {
    _status = AuthStatus.authenticating;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.register(
        RegisterRequest(
          name: name,
          email: email,
          password: password,
          targetCargo: targetCargo,
        ),
      );
      _currentUser = response;
      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } on ApiException catch (e) {
      _errorMessage = e.message;
      _status = AuthStatus.error;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Falha inesperada ao registrar novo aluno.';
      _status = AuthStatus.error;
      notifyListeners();
      return false;
    }
  }

  /// Encerra a sessao ativa
  Future<void> logout() async {
    await _repository.logout();
    _currentUser = null;
    _status = AuthStatus.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }

  /// Limpa mensagem de erro da tela
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
