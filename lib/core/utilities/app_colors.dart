import 'dart:ui';

import '../helpers/common_imports.dart';

/// for common color between two themes
class AppColors{
  AppColors._();
  static const Color primary = Color(0xff5B9EE1);
  static const Color white = Color(0xffFFFFFF);
  static const Color secondaryText = Color(0xff707B81);
  static const Color lightBlue = Color(0xffE5EEF7);
  static const Color gray = Colors.grey;
}

/// To setup light theme
class AppColorsLight{
  AppColorsLight._();
  static const Color background = Color(0xffF8F9FA);
  static const Color primary = Color(0xff5B9EE1);
  static const Color textPrimaryColor = Color(0xff1A2530);
  static const Color white = AppColors.white;
}

/// To setup light theme
class AppColorsDark{
  AppColorsDark._();
  static const Color background = Color(0xff1A2530);
  static const Color primary = Color(0xff5B9EE1);
  static const Color textPrimaryColor = AppColors.white;
}