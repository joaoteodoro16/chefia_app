import 'package:bloc/bloc.dart';
import 'package:chefia_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chefia_app/app/features/auth/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      emit(state.copyWith(status: LoginStatus.success, userLogged: user));
    } catch (e) {
      emit(
        state.copyWith(status: LoginStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
