import 'package:chefia_app/app/presentation/splash/cubit/splash_cubit.dart';
import 'package:chefia_app/app/presentation/splash/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SplashProvider {
  SplashProvider._();
  static Widget get providers => MultiProvider(
    providers: [Provider(create: (context) => SplashCubit())],
    child: SplashScreen(),
  );
}
