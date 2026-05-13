import 'package:chefia_app/app/core/exceptions/app_exception.dart';
import 'package:chefia_app/app/core/rest_client/app_rest_client.dart';
import 'package:chefia_app/app/data/models/login_request_model.dart';
import 'package:chefia_app/app/data/models/user_model.dart';
import 'package:dio/dio.dart';

import './auth_remote_datasource.dart';

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
      return UserModel.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException(
          'E-mail ou senha inválidos. Por favor, verifique suas credenciais e tente novamente.',
        );
      }
      throw AppException('Falha ao realizar o login');
    } catch (e) {
      throw AppException('Falha ao realizar o login');
    }
  }
}
