// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/presentation/managers/on_boarding/on_boarding_view_model.dart'
    as _i4;
import '../providers/language_provirder.dart' as _i3;
import '../providers/theme_provider.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.LanguageProvider>(() => _i3.LanguageProvider());
    gh.factory<_i4.OnBoardingViewModel>(() => _i4.OnBoardingViewModel());
    gh.singleton<_i5.ThemeProvider>(() => _i5.ThemeProvider());
    return this;
  }
}
