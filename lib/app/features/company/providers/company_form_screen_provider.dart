import 'package:chefia_app/app/features/company/data/datasources/remote/company_remote_datasource.dart';
import 'package:chefia_app/app/features/company/data/datasources/remote/company_remote_datasource_impl.dart';
import 'package:chefia_app/app/features/company/domain/repositories/company_repository.dart';
import 'package:chefia_app/app/features/company/domain/repositories/company_repository_impl.dart';
import 'package:chefia_app/app/features/company/domain/usecases/contracts/create_company_usecase.dart';
import 'package:chefia_app/app/features/company/domain/usecases/impl/create_company_usecase_impl.dart';
import 'package:chefia_app/app/features/company/presentation/cubit/company_cubit.dart';
import 'package:chefia_app/app/features/company/presentation/screens/company_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CompanyFormScreenProvider {
  CompanyFormScreenProvider._();

  static Widget get providers => MultiProvider(
    providers: [
      Provider<CompanyRemoteDatasource>(
        create: (context) =>
            CompanyRemoteDatasourceImpl(restClient: context.read()),
      ),
      Provider<CompanyRepository>(
        create: (context) =>
            CompanyRepositoryImpl(remoteDatasource: context.read()),
      ),
      Provider<CreateCompanyUsecase>(
        create: (context) =>
            CreateCompanyUsecaseImpl(repository: context.read()),
      ),
      BlocProvider(create: (context) => CompanyCubit(createCompanyUsecase: context.read())),
    ],
    child: CompanyFormScreen(),
  );
}
