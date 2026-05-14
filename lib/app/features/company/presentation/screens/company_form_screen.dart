import 'package:brasil_fields/brasil_fields.dart';
import 'package:chefia_app/app/core/extensions/localization_extension.dart';
import 'package:chefia_app/app/core/provider/app_cubit.dart';
import 'package:chefia_app/app/core/ui/base_state/base_state.dart';
import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/widgets/app_button.dart';
import 'package:chefia_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:chefia_app/app/features/company/domain/usecases/params/create_company_params.dart';
import 'package:chefia_app/app/features/company/presentation/cubit/company_cubit.dart';
import 'package:chefia_app/app/features/company/presentation/cubit/company_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class CompanyFormScreen extends StatefulWidget {
  const CompanyFormScreen({super.key});

  @override
  State<CompanyFormScreen> createState() => _CompanyFormScreenState();
}

class _CompanyFormScreenState
    extends BaseState<CompanyFormScreen, CompanyCubit> {
  final _nameEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _cnpjEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameEC.dispose();
    _phoneEC.dispose();
    _cnpjEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if (state.status == CompanyStatus.success) {
          hideLoader();
          showSuccess('Empresa criada com sucesso!');
        } else if (state.status == CompanyStatus.error) {
          hideLoader();
          showError(
            state.errorMessage ?? 'Ocorreu um erro ao criar a empresa.',
          );
        } else if (state.status == CompanyStatus.loading) {
          showLoader();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastrar nova empresa')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.business,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  label: context.l10n.name,
                  controller: _nameEC,
                  validator: Validatorless.multiple([
                    Validatorless.required(context.l10n.requiredField),
                    Validatorless.min(3, context.l10n.nameTooShort),
                  ]),
                ),
                AppTextFormField(
                  label: context.l10n.phone,
                  controller: _phoneEC,
                  validator: Validatorless.multiple([
                    Validatorless.required(context.l10n.requiredField),
                    Validatorless.phone(context.l10n.invalidPhone),
                  ]),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                ),
                AppTextFormField(
                  label: 'CNPJ',
                  controller: _cnpjEC,
                  validator: Validatorless.multiple([
                    Validatorless.required(context.l10n.cnpjRequired),
                    Validatorless.cnpj(context.l10n.cnpjInvalid),
                  ]),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CnpjInputFormatter(),
                  ],
                ),
                AppButton(
                  title: context.l10n.save,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final params = CreateCompanyParams(
                        name: _nameEC.text,
                        phone: _phoneEC.text,
                        cnpj: _cnpjEC.text,
                        userId: context.read<AppCubit>().state.userLogged!.id,
                      );
                      await controller.createCompany(params: params);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
