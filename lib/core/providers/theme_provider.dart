import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:oxy_boots/core/app_const/app_const_keys.dart';

import '../helpers/shared_pref_helpers.dart';

@singleton
class ThemeProvider extends ChangeNotifier {
  String _currentTheme = AppConstKeys.lightThemeKey;

  Future<void> changeTheme() async {
    if (_currentTheme == AppConstKeys.lightThemeKey) {
      _currentTheme = AppConstKeys.darkThemeKey;
    } else {
      _currentTheme = AppConstKeys.lightThemeKey;
    }
    await SharedPrefHelper.setDate(AppConstKeys.appThemeKey, _currentTheme);
    notifyListeners();
  }

  String getCurrentAppTheme() {
    return _currentTheme;
  }
}
