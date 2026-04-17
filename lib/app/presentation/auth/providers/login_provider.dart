import 'package:chefia_app/app/presentation/auth/cubit/login/login_cubit.dart';
import 'package:chefia_app/app/presentation/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginProvider {
  LoginProvider._();

  static Widget get providers => MultiProvider(
    providers: [Provider(create: (context) => LoginCubit())],
    child: LoginScreen(),
  );
}
