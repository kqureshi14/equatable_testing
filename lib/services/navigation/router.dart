import 'package:auto_route/auto_route.dart';
import 'package:equatable_testing/services/navigation/router.gr.dart';
//
// import 'package:equatable_testing/constants/constants.dart';
// import 'package:equatable_testing/services/navigation/router.gr.dart';

export 'router.gr.dart';

abstract class Routes {
  static const login = '/login';
  static const splash = '/splash';
  static const equatableDemo = '/equatableDemo';
}

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: LoginRoute.page, path: Routes.login),
    AutoRoute(page: EquatableDemo.page, path: Routes.equatableDemo),

    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
