
import 'package:bloc/bloc.dart';
import 'package:chefia_app/app/presentation/auth/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(const LoginState.initial());
}