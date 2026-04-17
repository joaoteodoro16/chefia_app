import 'package:flutter/material.dart';

class ChefiaApp extends StatelessWidget {
  const ChefiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chefia',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      );
  }
}
