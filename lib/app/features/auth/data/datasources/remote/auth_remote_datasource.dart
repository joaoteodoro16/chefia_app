import 'package:chefia_app/app/features/auth/data/models/login_request_model.dart';
import 'package:chefia_app/app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {

  Future<UserModel> login({
    required LoginRequestModel loginRequest,
  });
}