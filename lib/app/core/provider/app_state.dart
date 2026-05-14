import 'package:chefia_app/app/features/auth/domain/entities/user.dart';
import 'package:chefia_app/app/features/company/domain/entities/company.dart';
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final User? userLogged;
  final Company? company;

  const AppState({
    this.userLogged,
    this.company,
  });

  const AppState.initial() : this();

  AppState copyWith({
    User? userLogged,
    Company? company,
    bool clearUserLogged = false,
    bool clearCompany = false,
  }) {
    return AppState(
      userLogged: clearUserLogged ? null : userLogged ?? this.userLogged,
      company: clearCompany ? null : company ?? this.company,
    );
  }

  @override
  List<Object?> get props => [userLogged, company];
}