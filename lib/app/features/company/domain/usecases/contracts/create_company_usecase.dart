
import 'package:chefia_app/app/features/company/domain/entities/company.dart';

abstract class CreateCompanyUsecase {
  Future<void> call({required Company company, required String initialUserId});
}