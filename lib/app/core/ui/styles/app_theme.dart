import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
    fontFamily: AppTextStyles.font,
    primaryColor: AppColors.primary,
  );
}
