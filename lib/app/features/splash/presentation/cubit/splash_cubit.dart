
import 'package:bloc/bloc.dart';
import 'package:chefia_app/app/features/splash/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit() : super(const SplashState.initial());

  Future<void> loadApp() async {
    emit(state.copyWith(status: SplashStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: SplashStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SplashStatus.failure, errorMessage: e.toString()));
    }
  }
}