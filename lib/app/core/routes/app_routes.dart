import 'package:chefia_app/app/presentation/splash/provider/splash_provider.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => SplashProvider.providers,
  };
}
