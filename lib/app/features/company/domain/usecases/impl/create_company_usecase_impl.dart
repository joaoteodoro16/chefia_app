import 'package:chefia_app/app/features/company/domain/entities/company.dart';
import 'package:chefia_app/app/features/company/domain/repositories/company_repository.dart';

import '../contracts/create_company_usecase.dart';

class CreateCompanyUsecaseImpl extends CreateCompanyUsecase {
  final CompanyRepository _repository;

  CreateCompanyUsecaseImpl({required CompanyRepository repository})
    : _repository = repository;

  @override
  Future<void> call({required Company company, required String initialUserId}) async {
    await _repository.createCompany(company: company, userId: initialUserId);
  }
}
