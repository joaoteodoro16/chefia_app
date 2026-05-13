import 'package:chefia_app/app/core/extensions/localization_extension.dart';
import 'package:chefia_app/app/core/ui/base_state/base_state.dart';
import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chefia_app/app/core/ui/widgets/app_button.dart';
import 'package:chefia_app/app/core/ui/widgets/app_logo.dart';
import 'package:chefia_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:chefia_app/app/core/ui/widgets/locale_selector.dart';
import 'package:chefia_app/app/presentation/auth/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginCubit> {
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
                      SafeArea(
                        bottom: false,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: LocaleSelector(),
                          ),
                        ),
                      ),

                      AppLogo(size: 250),

                      Text(
                        context.l10n.accessMyAccount,
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 10),

                      AppTextFormField(
                        label: context.l10n.email,
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required(
                            context.l10n.requiredField,
                          ),
                          Validatorless.email(context.l10n.invalidEmail),
                        ]),
                      ),

                      const SizedBox(height: 15),

                      AppTextFormField(
                        label: context.l10n.password,
                        obscureText: true,
                        controller: _passwordEC,
                        validator: Validatorless.required(
                          context.l10n.requiredField,
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            context.l10n.forgotPassword,
                            style: context.textStyles.textMedium.copyWith(
                              color: const Color.fromARGB(255, 172, 172, 172),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      AppButton(
                        title: context.l10n.login,
                        onPressed: () async {
                          final validate =
                              _formKey.currentState?.validate() ?? false;

                          if (validate) {
                            await controller.login(
                              email: _emailEC.text,
                              password: _passwordEC.text,
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 15),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          context.l10n.createAccount,
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
              '${context.l10n.version} 1.0.0',
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
