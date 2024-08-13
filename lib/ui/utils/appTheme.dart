import 'package:e_commerce_app/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static  ThemeData mainTheme =ThemeData(
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: AppColors.whiteColor
      ),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.whiteColor
      ),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: AppColors.whiteColor
      ),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: AppColors.darkPrimaryColor
      ),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: AppColors.darkPrimaryColor
      ),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.darkPrimaryColor
      ),
    )

  );
}