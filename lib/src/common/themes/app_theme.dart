import 'package:fake_store_app/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppThemes {
  /// Light theme
  static final light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.light,
    fontFamily: "Poppins",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.dark,
      ),
      bodySmall: TextStyle(
        color: AppColors.grey,
      ),
      labelSmall: TextStyle(
        color: AppColors.grey,
      ),
    ),
  );

  /// Dark theme
  static final dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.dark,
    fontFamily: "Poppins",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.light,
      ),
      bodySmall: TextStyle(
        color: AppColors.grey,
      ),
      labelSmall: TextStyle(
        color: AppColors.grey,
      ),
    ),
  );
}
