import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chefia_app/app/core/ui/widgets/app_button.dart';
import 'package:chefia_app/app/core/ui/widgets/app_logo.dart';
import 'package:chefia_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppLogo(size: 250),
                      Text(
                        'Acessar minha conta',
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
                        label: 'Email',
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Email obrigatório'),
                          Validatorless.email('Email inválido'),
                        ]),
                      ),
                      const SizedBox(height: 15),
                      AppTextFormField(
                        label: 'Senha',
                        obscureText: true,
                        controller: _passwordEC,
                        validator: Validatorless.required('Senha obrigatória'),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueci minha senha',
                            textAlign: TextAlign.start,
                            style: context.textStyles.textMedium.copyWith(
                              color: const Color.fromARGB(255, 172, 172, 172),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      AppButton(
                        title: 'Entrar',
                        onPressed: () {
                          final validate =
                              _formKey.currentState?.validate() ?? false;
                          if (validate) {}
                        },
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Criar minha conta',
                          textAlign: TextAlign.center,
                          style: context.textStyles.textMedium.copyWith(
                            color: AppColors.primary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Versão 1.0.0',
              textAlign: TextAlign.center,
              style: context.textStyles.textMedium.copyWith(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
