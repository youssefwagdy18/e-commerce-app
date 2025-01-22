import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
      ),
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: AppColors.whiteColor),
        titleMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.whiteColor),
        titleSmall: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: AppColors.whiteColor),
        bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.darkPrimaryColor),
        bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.darkPrimaryColor),
        bodySmall: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.darkPrimaryColor),
      ));
}
