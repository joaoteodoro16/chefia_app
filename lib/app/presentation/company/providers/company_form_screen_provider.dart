import 'package:chefia_app/app/presentation/company/screens/company_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyFormScreenProvider {
  CompanyFormScreenProvider._();

  static Widget get providers =>
      MultiProvider(providers: [
        Provider(create: (context) => Object(),)
      ], child: CompanyFormScreen());
}
