import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boots/core/extensions/extensions.dart';
import 'package:oxy_boots/core/utilities/app_colors.dart';
import 'package:oxy_boots/core/utilities/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          context.localization.app_name,
          style: AppTextStyles.logoStyle,
        ),
      ),
    );
  }
}
