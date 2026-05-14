import 'package:chefia_app/app/core/preferences/app_shared_preferences.dart';
import 'package:chefia_app/app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:chefia_app/app/features/auth/data/models/login_request_model.dart';
import 'package:chefia_app/app/features/auth/domain/entities/user.dart';
import 'package:chefia_app/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final AppSharedPreferences _appSharedPreferences;

  AuthRepositoryImpl({required AuthRemoteDatasource remoteDatasource, required AppSharedPreferences appSharedPreferences})
    : _remoteDatasource = remoteDatasource,
      _appSharedPreferences = appSharedPreferences;

  @override
  Future<User> login({required String email, required String password}) async {
    final userModel = await _remoteDatasource.login(
      loginRequest: LoginRequestModel(email: email, password: password),
    );
    
    await _appSharedPreferences.setAccessToken(accessToken: userModel.accessToken);

    final user = User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      companyId: userModel.companyId,
      role: userModel.role,
      accessToken: userModel.accessToken, 
    );
    return user;
  }
}
