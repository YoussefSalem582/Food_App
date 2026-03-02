import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.Sen,
    // splashFactory is used to set the default splash effect for the app
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    // colorScheme is used to set the primary color and other colors of the app
    colorScheme: ColorScheme.fromSeed(
      // seedColor is the primary color of the app
      seedColor: AppColors.primaryColor,
      // onSurface is the color of text and icons on surfaces
      // onSurface: AppColors.black,
    ),
    // textButton theme to set the default text color for text buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    // divider color to set the default color for dividers
    dividerColor: Colors.transparent,
    // dividerTheme: DividerThemeData(color: AppColors.accentColor),
    // appBar theme to set the default background color for app bars
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
    ),
    // input decoration theme to set the default style for text form fields
    inputDecorationTheme: InputDecorationTheme(
      // fillColor: AppColors.formColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
    //
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   type: BottomNavigationBarType.fixed,
    //   backgroundColor: AppColors.backgroundColor,
    //   selectedItemColor: AppColors.primaryColor,
    //   unselectedItemColor: AppColors.textSubtitleColor,
    //   selectedLabelStyle: AppTextsStyles.caption2.copyWith(
    //     fontWeight: FontWeight.w600,
    //     height: 2,
    //   ),
    //   unselectedLabelStyle: AppTextsStyles.caption2.copyWith(
    //     fontWeight: FontWeight.w600,
    //     height: 2,
    //   ),
    // ),
  );
}
