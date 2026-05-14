
import 'package:chefia_app/app/features/auth/domain/entities/user/user_role.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String? companyId;
  final UserRole role;
  final String accessToken;
  User({
    required this.id,
    required this.name,
    required this.email,
    this.companyId,
    required this.role,
    required this.accessToken,
  });
}