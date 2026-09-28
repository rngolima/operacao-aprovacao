import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';

/// Interceptor Dio para Gerenciamento Automatico de Token JWT.
/// Injeta `Authorization: Bearer <token>` nas requisicoes protegidas
/// e lida com expiracao de token (HTTP 401).
class AuthInterceptor extends Interceptor {
  final SecureStorageService _storageService;

  AuthInterceptor(this._storageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Endpoints publicos que nao devem receber header de autorizacao
    final isPublic = options.path.contains('/auth/login') ||
        options.path.contains('/auth/register') ||
        options.path.contains('/health');

    if (!isPublic) {
      final token = await _storageService.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Se receber 401 Unauthorized em rota protegida, limpa a sessao
    if (err.response?.statusCode == 401) {
      await _storageService.deleteToken();
    }
    return handler.next(err);
  }
}
