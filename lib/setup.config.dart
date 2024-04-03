// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app.dart' as _i9;
import 'base/screen_layout_base/screen_layout_base_vm.dart' as _i8;
import 'screens/login/login_screen_vm.dart' as _i7;
import 'screens/splash/splash_screen_vm.dart' as _i5;
import 'services/navigation/router.dart' as _i10;
import 'services/services.dart' as _i3;
import 'setup.dart' as _i11;
import 'theme/theme.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.IStorageService>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  await gh.factoryAsync<_i3.INetworkService<dynamic>>(
    () => registerModule.network,
    preResolve: true,
  );
  await gh.factoryAsync<_i3.ApplicationService>(
    () => registerModule.appService,
    preResolve: true,
  );
  gh.singleton<_i3.IDeviceService>(() => registerModule.deviceService);
  gh.singleton<_i4.IAppThemeData>(() => registerModule.theme);
  gh.singleton<_i3.INavigationService<dynamic>>(
      () => registerModule.navigationService);
  gh.singleton<_i3.AppRouter>(() => registerModule.appRouter);
  gh.factory<_i5.SplashScreenViewModel>(() => _i5.SplashScreenViewModel(
        navigationService: gh<_i3.INavigationService<dynamic>>(),
        storage: gh<_i3.IStorageService>(),
        appService: gh<_i3.ApplicationService>(),
        network: gh<_i3.INetworkService<dynamic>>(),
      ));
  gh.factory<_i6.Key>(() => registerModule.key);
  gh.factory<_i7.LoginScreenViewModel>(() => _i7.LoginScreenViewModel(
        navigation: gh<_i3.INavigationService<dynamic>>(),
        network: gh<_i3.INetworkService<dynamic>>(),
        storage: gh<_i3.IStorageService>(),
        appService: gh<_i3.ApplicationService>(),
      ));
  gh.factory<_i8.ScreenLayoutBaseViewModel>(() => _i8.ScreenLayoutBaseViewModel(
        appService: gh<_i3.ApplicationService>(),
        navigationService: gh<_i3.INavigationService<dynamic>>(),
      ));
  gh.singleton<_i9.App>(() => _i9.App(
        appThemeData: gh<_i4.IAppThemeData>(),
        appRouter: gh<_i10.AppRouter>(),
        key: gh<_i6.Key>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i11.RegisterModule {
  @override
  _i6.UniqueKey get key => _i6.UniqueKey();
}
