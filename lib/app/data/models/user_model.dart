
import '../../domain/entities/user/user_role.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String companyId;
  final UserRole role;
  final String accessToken;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.companyId,
    required this.role,
    required this.accessToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      companyId: map['companyId'] as String,
      role: UserRole.fromCode(map['role'] as int),
      accessToken: map['accessToken'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'companyId': companyId,
      'role': role.code,
      'accessToken': accessToken,
    };
  }
}