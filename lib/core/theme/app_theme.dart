import 'package:flutter/material.dart';
import 'package:movie/core/theme/app_colors.dart';

abstract class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondaryColor,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      surface: AppColors.secondaryColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      focusColor: AppColors.accentColor,
      fillColor: AppColors.accentColor,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff282A28),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff282A28),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff282A28),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff282A28),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.secondaryColor,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    ),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xffF6BD00)),
      backgroundColor: AppColors.accentColor,
      // elevation: 1,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w500,
      ),

      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),

      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
  );
}
