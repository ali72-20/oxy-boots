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

  static TextStyle font20W400 = TextStyle(
    fontFamily: FontFamily.airbnbCereal,
    fontSize: 20.sp,
    fontWeight: AppFontWeights.w400,
    color: AppColors.secondaryText
  );

  static TextStyle font40W500 = TextStyle(
    fontFamily: FontFamily.airbnbCereal,
    fontSize: 40.sp,
    fontWeight: AppFontWeights.w500,
  );

  static TextStyle font18W500 = TextStyle(
    fontSize: 18.sp,
    fontFamily: FontFamily.airbnbCereal,
    fontWeight: AppFontWeights.w500,
    color: AppColors.white
  );
}