import 'package:chefia_app/app/features/company/domain/entities/company.dart';

class CreateCompanyParams {
  final String name;
  final String phone;
  final String cnpj;
  final String userId;
  CreateCompanyParams({
    required this.name,
    required this.phone,
    required this.cnpj,
    required this.userId,
  });

  Company toCompany() {
    return Company(
      id: '', // O ID será gerado pelo backend
      name: name,
      phone: phone,
      cnpj: cnpj,
    );
  }
}
