import 'package:chefia_app/app/core/ui/styles/app_theme.dart';
import 'package:flutter/material.dart';

class ChefiaApp extends StatelessWidget {
  const ChefiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chefia',
      theme: AppTheme.theme
      );
  }
}
