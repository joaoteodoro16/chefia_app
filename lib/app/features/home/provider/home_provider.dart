import 'package:chefia_app/app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider {
  HomeProvider._();

  static Widget get providers => MultiProvider(
    providers: [Provider(create: (context) => Object())],
    child: HomeScreen(),
  );
}
