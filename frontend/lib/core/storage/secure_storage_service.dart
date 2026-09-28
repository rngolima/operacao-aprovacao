import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Servico de Persistencia Segura de Credenciais e Tokens JWT.
/// Utiliza Keychain no iOS, KeyStore/EncryptedSharedPreferences no Android
/// e armazenamento web seguro para protecao contra vazamento de credenciais.
class SecureStorageService {
  final FlutterSecureStorage _storage;

  static const String _keyToken = 'op_jwt_token';
  static const String _keyUserEmail = 'op_user_email';
  static const String _keyUserRole = 'op_user_role';
  static const String _keyTargetConcurso = 'op_target_concurso';

  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock,
              ),
            );

  /// Salva o token JWT de autenticacao.
  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  /// Recupera o token JWT. Retorna null se inexistente.
  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  /// Remove o token JWT (Logout).
  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  /// Salva os metadados do usuario autenticado.
  Future<void> saveUserData({
    required String email,
    required String role,
    String targetConcurso = 'PC-PE',
  }) async {
    await _storage.write(key: _keyUserEmail, value: email);
    await _storage.write(key: _keyUserRole, value: role);
    await _storage.write(key: _keyTargetConcurso, value: targetConcurso);
  }

  /// Recupera o e-mail do usuario logado.
  Future<String?> getUserEmail() async {
    return await _storage.read(key: _keyUserEmail);
  }

  /// Recupera a role do usuario logado.
  Future<String?> getUserRole() async {
    return await _storage.read(key: _keyUserRole);
  }

  /// Recupera o concurso alvo (default: PC-PE).
  Future<String> getTargetConcurso() async {
    final value = await _storage.read(key: _keyTargetConcurso);
    return value ?? 'PC-PE';
  }

  /// Verifica se ha sessao ativa com token.
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Limpa toda a sessao de forma segura.
  Future<void> clearSession() async {
    await _storage.deleteAll();
  }
}
