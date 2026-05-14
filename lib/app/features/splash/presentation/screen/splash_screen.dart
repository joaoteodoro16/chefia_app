import 'package:chefia_app/app/core/routes/app_routes.dart';
import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/widgets/app_logo.dart';
import 'package:chefia_app/app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:chefia_app/app/features/splash/presentation/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<SplashCubit>();
      cubit.loadApp();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        switch (state.status) {
          case SplashStatus.success:
            Navigator.pushReplacementNamed(context, AppRoutes.login);
            break;
          case SplashStatus.failure:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Erro desconhecido'),
              ),
            );
            break;
          default:
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                AppLogo(size: 230),
                Visibility(
                  visible: state.status == SplashStatus.loading,
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
