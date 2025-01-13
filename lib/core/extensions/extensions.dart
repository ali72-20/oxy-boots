import 'package:oxy_boots/core/helpers/common_imports.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Context on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}


extension Localization on BuildContext{
  AppLocalizations get localization => AppLocalizations.of(this)!;
}

