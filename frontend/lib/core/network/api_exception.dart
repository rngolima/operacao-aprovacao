import 'package:dio/dio.dart';

/// Excecao de Rede Padronizada da Operacao Aprovacao.
/// Converte erros brutos de HTTP/Dio em mensagens taticas e compreensiveis.
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  const ApiException({
    required this.message,
    this.statusCode,
    this.details,
  });

  factory ApiException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiException(
          message: 'Tempo limite esgotado ao contatar o servidor operacional. Verifique sua conexao.',
          statusCode: 408,
        );

      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final responseData = dioException.response?.data;

        String serverMessage = 'Erro operacional no servidor ($statusCode).';
        if (responseData is Map<String, dynamic>) {
          if (responseData['message'] != null) {
            serverMessage = responseData['message'].toString();
          } else if (responseData['error'] != null) {
            serverMessage = responseData['error'].toString();
          }
        }

        switch (statusCode) {
          case 400:
            return ApiException(
              message: serverMessage.isNotEmpty ? serverMessage : 'Requisicao invalida. Verifique os dados informados.',
              statusCode: 400,
              details: responseData,
            );
          case 401:
            return const ApiException(
              message: 'Credenciais invalidas ou sessao expirada. Efetue login novamente.',
              statusCode: 401,
            );
          case 403:
            return const ApiException(
              message: 'Acesso negado. Voce nao possui permissao para este recurso.',
              statusCode: 403,
            );
          case 404:
            return const ApiException(
              message: 'Recurso operacional nao encontrado no servidor.',
              statusCode: 404,
            );
          case 422:
            return ApiException(
              message: serverMessage.isNotEmpty ? serverMessage : 'Falha de validacao dos dados operacionais.',
              statusCode: 422,
              details: responseData,
            );
          case 500:
          default:
            return ApiException(
              message: 'Falha interna no servidor central. Tente novamente em instantes.',
              statusCode: statusCode ?? 500,
              details: responseData,
            );
        }

      case DioExceptionType.cancel:
        return const ApiException(
          message: 'A requisicao operacional foi cancelada.',
        );

      case DioExceptionType.connectionError:
        return const ApiException(
          message: 'Nao foi possivel conectar ao servidor. Verifique se o backend esta ativo.',
        );

      case DioExceptionType.badCertificate:
        return const ApiException(
          message: 'Falha de certificado SSL/TLS de seguranca.',
        );

      case DioExceptionType.unknown:
      default:
        return ApiException(
          message: 'Ocorreu uma falha inesperada: ${dioException.message ?? "Erro desconhecido"}',
        );
    }
  }

  @override
  String toString() => 'ApiException(statusCode: $statusCode, message: $message)';
}
