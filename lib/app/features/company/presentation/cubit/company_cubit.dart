import 'package:chefia_app/app/core/exceptions/app_exception.dart';
import 'package:chefia_app/app/features/company/domain/usecases/contracts/create_company_usecase.dart';
import 'package:chefia_app/app/features/company/domain/usecases/params/create_company_params.dart';
import 'package:chefia_app/app/features/company/presentation/cubit/company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CreateCompanyUsecase _createCompanyUsecase;

  CompanyCubit({required CreateCompanyUsecase createCompanyUsecase})
    : _createCompanyUsecase = createCompanyUsecase,
      super(CompanyState.initial());

  Future<void> createCompany({required CreateCompanyParams params}) async {
    emit(state.copyWith(status: CompanyStatus.loading));
    try {
      await _createCompanyUsecase.call(
        company: params.toCompany(),
        initialUserId: params.userId,
      );
      emit(state.copyWith(status: CompanyStatus.success));
    } on AppException catch (e) {
      emit(
        state.copyWith(status: CompanyStatus.error, errorMessage: e.message),
      );
    } catch (e) {
      emit(
        state.copyWith(status: CompanyStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
