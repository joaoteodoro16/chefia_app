import 'package:chefia_app/app/core/provider/app_provider.dart';
import 'package:chefia_app/app/core/routes/app_routes.dart';
import 'package:chefia_app/app/core/translate/locale_cubit.dart';
import 'package:chefia_app/app/core/translate/locale_state.dart';
import 'package:chefia_app/app/core/ui/styles/app_theme.dart';
import 'package:chefia_app/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ChefiaApp extends StatelessWidget {
  const ChefiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: const [Locale('pt'), Locale('en')],

            debugShowCheckedModeBanner: false,
            title: 'Chefia',
            theme: AppTheme.theme,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
