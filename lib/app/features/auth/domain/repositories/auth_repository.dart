import 'package:chefia_app/app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({
    required String email,
    required String password,
  });
}