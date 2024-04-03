// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:equatable_testing/equatable_demo.dart' as _i1;
import 'package:equatable_testing/screens/login/login_screen_v.dart' as _i2;
import 'package:equatable_testing/screens/splash/splash_screen_v.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EquatableDemo.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EquatableDemo(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SplashScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.EquatableDemo]
class EquatableDemo extends _i4.PageRouteInfo<void> {
  const EquatableDemo({List<_i4.PageRouteInfo>? children})
      : super(
          EquatableDemo.name,
          initialChildren: children,
        );

  static const String name = 'EquatableDemo';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<LoginRouteArgs> page =
      _i4.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<SplashRouteArgs> page =
      _i4.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}
