
import 'dart:convert';

import '../../domain/entities/user/user_role.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? companyId;
  final UserRole role;
  final String accessToken;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.companyId,
    required this.role,
    required this.accessToken,
  });



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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      companyId: map['companyId'],
      role: UserRole.fromCode(map['role']),
      accessToken: map['accessToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
