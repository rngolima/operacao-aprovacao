import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/network/api_exception.dart';

void main() {
  group('ApiException Testes Unitarios', () {
    test('Converte timeout de conexao em mensagem tática de tempo esgotado', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/auth/login'),
        type: DioExceptionType.connectionTimeout,
      );

      final apiException = ApiException.fromDioException(dioException);

      expect(apiException.statusCode, equals(408));
      expect(apiException.message, contains('Tempo limite esgotado'));
    });

    test('Converte HTTP 401 em mensagem de credenciais invalidas', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/auth/login'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/auth/login'),
          statusCode: 401,
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = ApiException.fromDioException(dioException);

      expect(apiException.statusCode, equals(401));
      expect(apiException.message, contains('Credenciais invalidas'));
    });

    test('Converte HTTP 403 em mensagem de acesso negado', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/simulados'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/simulados'),
          statusCode: 403,
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = ApiException.fromDioException(dioException);

      expect(apiException.statusCode, equals(403));
      expect(apiException.message, contains('Acesso negado'));
    });

    test('Extrai mensagem customizada enviada pelo backend em HTTP 400', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/auth/register'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/auth/register'),
          statusCode: 400,
          data: {'message': 'Ja existe um usuario cadastrado com este e-mail.'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = ApiException.fromDioException(dioException);

      expect(apiException.statusCode, equals(400));
      expect(apiException.message, equals('Ja existe um usuario cadastrado com este e-mail.'));
    });
  });
}
