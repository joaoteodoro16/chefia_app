import 'package:chefia_app/app/features/company/data/datasources/remote/company_remote_datasource.dart';
import 'package:chefia_app/app/features/company/data/models/create_company_dto.dart';
import 'package:chefia_app/app/features/company/domain/entities/company.dart';

import './company_repository.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyRemoteDatasource _remoteDatasource;

  CompanyRepositoryImpl({required CompanyRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  @override
  Future<void> createCompany({required Company company, required String userId}) async {
    await _remoteDatasource.createCompany(
      createCompanyDto: CreateCompanyDto.fromEntity(entity: company, userId: userId),
    );
  }
}
