import 'package:bloc/bloc.dart';
import 'package:chefia_app/app/core/provider/app_state.dart';
import 'package:chefia_app/app/features/auth/domain/entities/user.dart';
import 'package:chefia_app/app/features/company/domain/entities/company.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  void setUserLogged(User? user) {
    emit(state.copyWith(userLogged: user, clearUserLogged: user == null));
  }

  void setCompany(Company? company) {
    emit(state.copyWith(company: company, clearCompany: company == null));
  }

  void clear() {
    emit(const AppState.initial());
  }
}