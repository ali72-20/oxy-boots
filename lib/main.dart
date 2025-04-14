import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oxy_boots/core/app_const/app_const_keys.dart';
import 'package:oxy_boots/core/navigation/app_routes.dart';
import 'package:oxy_boots/core/navigation/app_routes_name.dart';
import 'package:oxy_boots/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/di.dart';
import 'core/localization/l10n.dart';
import 'core/providers/language_provirder.dart';
import 'core/utilities/thems.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => getIt<LanguageProvider>()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => getIt<ThemeProvider>())
      ],
      child: const OXYBOOTS(),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class OXYBOOTS extends StatelessWidget {
  const OXYBOOTS({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocale = Provider.of<LanguageProvider>(context);
    var appTheme = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutsName.onBoarding,
        navigatorKey: navKey,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        supportedLocales: L10n.all,
        onGenerateRoute: AppRouts.onGenerateRout,
        locale: appLocale.getCurrentLocal() == AppConstKeys.englishLocaleKey
            ? const Locale(AppConstKeys.englishLocaleKey)
            : const Locale(AppConstKeys.arabicLocaleKey),
        theme: appTheme.getCurrentAppTheme() == AppConstKeys.lightThemeKey
            ? AppThemData.light
            : AppThemData.dark,
      ),
    );
  }
}
