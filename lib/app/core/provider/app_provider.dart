import 'package:chefia_app/app/core/rest_client/app_rest_client.dart';
import 'package:chefia_app/app/core/translate/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AppRestClient()),
        BlocProvider(create: (_) => LocaleCubit()),
      ],
      child: child,
    );
  }
}
