import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transpaerntColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        // backgroundColor: AppColors.primaryColor,
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.WhiteColor,
        unselectedItemColor: AppColors.blackColor,
      ));
}
