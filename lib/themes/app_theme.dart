import 'package:flutter/material.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:islami_app/themes/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Janna',
    scaffoldBackgroundColor: AppColors.blackColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
          backgroundColor: AppColors.blackColor,
      titleTextStyle: TextStyles.font20BoldPrimaryColor,
      iconTheme: IconThemeData(
            color: AppColors.primaryColor,
      ),
    ),
  );
}
