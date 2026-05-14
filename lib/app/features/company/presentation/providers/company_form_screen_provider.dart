import 'package:chefia_app/app/features/company/presentation/cubit/company_cubit.dart';
import 'package:chefia_app/app/features/company/presentation/screens/company_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CompanyFormScreenProvider {
  CompanyFormScreenProvider._();

  static Widget get providers => MultiProvider(
    providers: [BlocProvider(create: (context) => CompanyCubit())],
    child: CompanyFormScreen(),
  );
}
