import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oxy_boots/core/utilities/app_colors.dart';
import 'package:oxy_boots/core/utilities/app_font_weights.dart';
import 'package:oxy_boots/gen/assets.gen.dart';
import 'package:oxy_boots/gen/fonts.gen.dart';


class AppTextStyles{
  AppTextStyles._();

  static TextStyle logoStyle = TextStyle(
    fontSize: 28.sp,
    fontWeight: AppFontWeights.w700,
    color: AppColors.white,
    fontFamily: FontFamily.airbnbCereal,
  );
}