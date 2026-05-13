import 'package:chefia_app/app/data/models/login_request_model.dart';
import 'package:chefia_app/app/data/models/user_model.dart';

abstract class AuthRemoteDatasource {

  Future<UserModel> login({
    required LoginRequestModel loginRequest,
  });
}