import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:equatable_testing/app_config.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/setup.config.dart';
import 'package:equatable_testing/services/network/logger_interceptor.dart';
import 'package:equatable_testing/helpers/connectivity_helper.dart';



final getIt = GetIt.instance;

late final AppConfig appConfig;

Future<dynamic> configureDependencies(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  var connectionStatus = ConnectivityHelper.getInstance();
  connectionStatus.initialize();

  appConfig = config;
  HttpOverrides.global = DevHttpOverrides(); // to ignore ssl certification
  return $initGetIt(getIt);
}

T locateService<T extends Object>() => getIt.get<T>();

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
@module
abstract class RegisterModule {
  static final _appRouter = AppRouter();

  final _navigationService = NavigationService(_appRouter.navigatorKey);

  final _deviceService = DeviceServiceImpl();

  @singleton
  IDeviceService get deviceService => _deviceService;

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  IAppThemeData get theme => DefaultTheme();

  @preResolve
  Future<IStorageService> get sharedPreferences async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPrefs(sharedPreferences: sharedPreferences);
  }

  @singleton
  INavigationService get navigationService => _navigationService;

  @preResolve
  Future<INetworkService> get network async => NetworkCall(
        client: InterceptedClient.build(
          interceptors: [LoggerInterceptor()],
        ),
        storage: await sharedPreferences,
        appService: await appService,
      );

  @singleton
  AppRouter get appRouter => _appRouter;

  @preResolve
  Future<ApplicationService> get appService async => ApplicationService(
        navigation: navigationService,
        storage: await sharedPreferences,
        appConfig: appConfig,
      );
}
