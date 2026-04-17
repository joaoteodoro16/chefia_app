import 'package:chefia_app/app/presentation/company/providers/company_form_screen_provider.dart';
import 'package:chefia_app/app/presentation/splash/provider/splash_provider.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String companyForm = '/company/form';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => SplashProvider.providers,
    companyForm: (context) => CompanyFormScreenProvider.providers,
  };
}
