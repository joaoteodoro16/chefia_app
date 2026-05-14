import 'package:chefia_app/app/features/company/presentation/cubit/company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyState.initial());
}
