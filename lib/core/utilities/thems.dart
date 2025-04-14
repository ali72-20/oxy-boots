import 'package:flutter/material.dart';
import 'package:oxy_boots/core/utilities/app_colors.dart';

class AppThemData {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColorsLight.background,
    primaryColor: AppColorsLight.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColorsLight.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColorsLight.textPrimaryColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: AppColorsLight.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: AppColorsLight.white,
        ),
      ),
    )
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColorsDark.background,
    primaryColor: AppColorsDark.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColorsLight.primary),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      ),
    ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColorsDark.textPrimaryColor,
        ),
      )
  );
}
