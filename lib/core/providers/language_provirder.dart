import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:oxy_boots/core/app_const/app_const_keys.dart';
import 'package:oxy_boots/core/helpers/shared_pref_helpers.dart';

@singleton
class LanguageProvider extends ChangeNotifier {
  String _currentAppLocale = AppConstKeys.englishLocaleKey;

  LanguageProvider() {
    SharedPrefHelper.getString(AppConstKeys.appLocaleKey).then((value) {
      if (value == null) {
        SharedPrefHelper.setDate(AppConstKeys.appLocaleKey, _currentAppLocale);
      } else {
        _currentAppLocale = value;
        notifyListeners();
      }
    });
  }

  /// change the app locale
  /// if the new locale is current app local nothing happen
  /// parameters [locale] the new locale
  Future<void> changeLocale(String locale) async {
    if (locale == _currentAppLocale) return;
    _currentAppLocale = locale;
    await SharedPrefHelper.setDate(AppConstKeys.appLocaleKey, locale);
    notifyListeners();
  }

  /// check if the current app locale is english
  bool isEn() {
    return _currentAppLocale == AppConstKeys.englishLocaleKey;
  }

  /// get the current app locale
  String getCurrentLocal() {
    return _currentAppLocale;
  }
}
