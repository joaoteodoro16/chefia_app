import 'package:chefia_app/app/core/exceptions/app_exception.dart';
import 'package:chefia_app/app/core/logger/app_logger.dart';
import 'package:chefia_app/app/core/rest_client/app_rest_client.dart';
import 'package:chefia_app/app/features/auth/data/models/login_request_model.dart';
import 'package:chefia_app/app/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final AppRestClient _restClient;

  AuthRemoteDatasourceImpl({required AppRestClient restClient})
    : _restClient = restClient;

  @override
  Future<UserModel> login({required LoginRequestModel loginRequest}) async {
    try {
      final response = await _restClient.unAuth().post(
        'User/auth',
        data: loginRequest.toMap(),
      );
      return UserModel.fromMap(response.data['data']);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException(
          'E-mail ou senha inválidos. '
          'Por favor, verifique suas credenciais e tente novamente.',
        );
      }
      await AppLogger.e('Erro ao realizar login', error: e, stackTrace: s);
      throw AppException('Não foi possível realizar o login.');
    } catch (e, s) {
      await AppLogger.e(
        'Erro inesperado ao realizar login',
        error: e,
        stackTrace: s,
      );
      throw AppException('Não foi possível realizar o login.');
    }
  }
}
