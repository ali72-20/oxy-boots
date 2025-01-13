import 'package:flutter/material.dart';
import 'package:oxy_boots/core/navigation/app_routes_name.dart';
import 'package:oxy_boots/src/presentation/pages/login/login_screen.dart';
import 'package:oxy_boots/src/presentation/pages/on_boarding/on_boarding_screen.dart';
import 'package:oxy_boots/src/presentation/pages/splash/splash_screen.dart';

class AppRouts {
  AppRouts._();

  static Route<dynamic> onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutsName.splash:
        return _handelMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
      case AppRoutsName.onBoarding:
        return _handelMaterialPageRoute(
            widget: OnBoardingScreen(), settings: settings);
      case AppRoutsName.login:
        return _handelMaterialPageRoute(widget: LoginScreen(), settings: settings);
      default:
        return _handelMaterialPageRoute(
            settings: settings, widget: const Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handelMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
