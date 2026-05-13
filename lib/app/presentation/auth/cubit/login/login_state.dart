
import 'package:chefia_app/app/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, error }
  
class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  final User? userLogged;

  const LoginState({required this.status, this.errorMessage, this.userLogged});

  const LoginState.initial() : status = LoginStatus.initial, errorMessage = null, userLogged = null;

  @override
  List<Object?> get props => [status, errorMessage, userLogged];

  LoginState copyWith({LoginStatus? status, String? errorMessage, User? userLogged}) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userLogged: userLogged ?? this.userLogged,
    );
  }
}