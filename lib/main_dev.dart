import 'package:flutter/material.dart';

import 'package:equatable_testing/app.dart';
import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/app_config.dart';
import 'package:equatable_testing/constants/constants.dart';



void main() async {
  var devAppConfig = AppConfig(
    appName: Strings.appName,
    flavor: Flavor.dev,
    baseUrl: Api.baseURL,
  );

  await configureDependencies(devAppConfig);

  runApp(locateService<App>());
}
