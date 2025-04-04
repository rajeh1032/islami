import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transpaerntColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // backgroundColor: AppColors.primaryColor,
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.WhiteColor,
        unselectedItemColor: AppColors.blackColor,
      ),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.WhiteColor)),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
        centerTitle: true,
      ));
}
