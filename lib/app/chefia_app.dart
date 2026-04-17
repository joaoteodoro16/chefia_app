import 'package:chefia_app/app/core/provider/app_provider.dart';
import 'package:chefia_app/app/core/routes/app_routes.dart';
import 'package:chefia_app/app/core/ui/styles/app_theme.dart';
import 'package:flutter/material.dart';

class ChefiaApp extends StatelessWidget {
  const ChefiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chefia',
        theme: AppTheme.theme,
        routes: AppRoutes.routes,
      ),
    );
  }
}
