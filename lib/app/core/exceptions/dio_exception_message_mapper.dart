import 'package:dio/dio.dart';

class DioExceptionMessageMapper {
  DioExceptionMessageMapper._();

  static String map(DioException exception) {
    final statusCode = exception.response?.statusCode;

    if (statusCode != null) {
      return _fromStatusCode(statusCode);
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'A requisição excedeu o tempo limite. Tente novamente.';
      case DioExceptionType.connectionError:
        return 'Não foi possível conectar ao servidor. Verifique sua internet.';
      case DioExceptionType.cancel:
        return 'A requisição foi cancelada.';
      case DioExceptionType.badCertificate:
        return 'Não foi possível validar o certificado de segurança.';
      case DioExceptionType.unknown:
      case DioExceptionType.badResponse:
        return 'Não foi possível processar a requisição. Tente novamente.';
    }
  }

  static String _fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Requisição inválida. Revise os dados enviados.';
      case 401:
        return 'Você não tem autorização para realizar esta ação.';
      case 403:
        return 'Acesso negado para esta operação.';
      case 404:
        return 'Recurso não encontrado.';
      case 409:
        return 'Conflito de dados. Verifique e tente novamente.';
      case 422:
        return 'Dados inválidos. Revise os campos informados.';
      case 429:
        return 'Muitas requisições. Aguarde alguns instantes e tente novamente.';
      case 500:
        return 'Erro interno do servidor. Tente novamente mais tarde.';
      case 502:
      case 503:
      case 504:
        return 'Serviço indisponível no momento. Tente novamente mais tarde.';
      default:
        return 'Ocorreu um erro inesperado. Tente novamente.';
    }
  }
}
