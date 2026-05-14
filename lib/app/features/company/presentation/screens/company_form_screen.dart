import 'package:brasil_fields/brasil_fields.dart';
import 'package:chefia_app/app/core/extensions/localization_extension.dart';
import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/widgets/app_button.dart';
import 'package:chefia_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class CompanyFormScreen extends StatefulWidget {
  const CompanyFormScreen({super.key});

  @override
  State<CompanyFormScreen> createState() => _CompanyFormScreenState();
}

class _CompanyFormScreenState extends State<CompanyFormScreen> {
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
    return Scaffold(
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para salvar os dados
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
