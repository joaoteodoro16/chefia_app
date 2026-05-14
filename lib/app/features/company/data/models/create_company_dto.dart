import 'dart:convert';

import 'package:chefia_app/app/features/company/domain/entities/company.dart';

class CreateCompanyDto {
  final String name;
  final String phone;
  final String cnpj;
  final String initialUserId;

  CreateCompanyDto({
    required this.name,
    required this.phone,
    required this.cnpj,
    required this.initialUserId,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'cnpj': cnpj, 'initialUserId': initialUserId};
  }

  factory CreateCompanyDto.fromMap(Map<String, dynamic> map) {
    return CreateCompanyDto(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      cnpj: map['cnpj'] ?? '',
      initialUserId: map['initialUserId'] ?? '',
    );
  }

  static CreateCompanyDto fromEntity({required Company entity, required String userId}) {
    return CreateCompanyDto(
      name: entity.name,
      phone: entity.phone,
      cnpj: entity.cnpj,
      initialUserId: userId,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateCompanyDto.fromJson(String source) =>
      CreateCompanyDto.fromMap(json.decode(source));
}
