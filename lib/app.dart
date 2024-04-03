import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable_testing/services/navigation/router.dart';
import 'package:injectable/injectable.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/screens/net_bloc/network_bloc.dart';
import 'package:equatable_testing/screens/net_bloc/network_event.dart';

@singleton
class App extends StatelessWidget {
  const App({
    required IAppThemeData appThemeData,
    required AppRouter appRouter,
    Key? key,
  })  : _appThemeData = appThemeData,
        _appRouter = appRouter,
        super(key: key);

  final IAppThemeData _appThemeData;
  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: _appThemeData.colors.secondaryBackground,
        statusBarIconBrightness: _appThemeData.darkBrightness,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NetworkBloc()..add(NetworkObserve()),
        )
      ],
      child: AppTheme(
        appThemeData: _appThemeData,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
