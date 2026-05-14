import 'package:chefia_app/app/features/company/domain/entities/company.dart';

abstract class CompanyRepository {
  Future<void> createCompany({required Company company, required String userId});
}