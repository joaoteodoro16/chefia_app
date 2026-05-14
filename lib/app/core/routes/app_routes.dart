import 'package:chefia_app/app/features/auth/providers/login_provider.dart';
import 'package:chefia_app/app/features/company/providers/company_form_screen_provider.dart';
import 'package:chefia_app/app/features/splash/presentation/provider/splash_provider.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String login = 'auth/login';
  static const String companyForm = '/company/form';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => SplashProvider.providers,
    login: (context) => LoginProvider.providers,
    companyForm: (context) => CompanyFormScreenProvider.providers,
  };
}
