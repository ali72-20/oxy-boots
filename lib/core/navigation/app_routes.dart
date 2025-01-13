import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boots/core/navigation/app_routes_name.dart';
import 'package:oxy_boots/src/presentation/pages/splash/splash_screen.dart';

class AppRouts {
  AppRouts._();

  static Route<dynamic> onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutsName.splash:
        return _handelMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
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
