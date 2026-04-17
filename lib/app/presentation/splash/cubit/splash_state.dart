import 'package:equatable/equatable.dart';

enum SplashStatus{
  initial,
  loading,
  success,
  failure
}

class SplashState extends Equatable{
  final SplashStatus status;
  final String? errorMessage;

  const SplashState.initial() : status = SplashStatus.initial, errorMessage = null;

    const SplashState({
    required this.status,
    this.errorMessage
  });

  @override
  List<Object?> get props => [status, errorMessage];

  SplashState copyWith({
    SplashStatus? status,
    String? errorMessage    
  }) {
    return SplashState(
          status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}