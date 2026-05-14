import 'dart:convert';


class CreateCompanyDto {
  final String name;
  final String phone;
  final String cnpj;

  CreateCompanyDto({
    required this.name,
    required this.phone,
    required this.cnpj,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'cnpj': cnpj,
    };
  }

  factory CreateCompanyDto.fromMap(Map<String, dynamic> map) {
    return CreateCompanyDto(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      cnpj: map['cnpj'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateCompanyDto.fromJson(String source) => CreateCompanyDto.fromMap(json.decode(source));
}
