import 'package:chefia_app/app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:chefia_app/app/features/auth/data/datasources/remote/auth_remote_datasource_impl.dart';
import 'package:chefia_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chefia_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chefia_app/app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:chefia_app/app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginProvider {
  LoginProvider._();

  static Widget get providers => MultiProvider(
    providers: [
      Provider<AuthRemoteDatasource>(create: (context) =>  AuthRemoteDatasourceImpl(restClient: context.read()),),
      Provider<AuthRepository>(create: (context) => AuthRepositoryImpl(remoteDatasource: context.read()),),
      BlocProvider(create: (context) => LoginCubit(authRepository: context.read()))],
    child: LoginScreen(),
  );
}
