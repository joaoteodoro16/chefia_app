import 'package:chefia_app/app/features/company/data/models/create_company_dto.dart';

abstract class CompanyRemoteDatasource {
    Future<void> createCompany({required CreateCompanyDto createCompanyDto});
}