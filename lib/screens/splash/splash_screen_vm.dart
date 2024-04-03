import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:equatable_testing/app_config.dart';
import 'package:equatable_testing/base/base.dart';
import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/screens/splash/splash_screen_m.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/helpers/enum_helper.dart';

@injectable
class SplashScreenViewModel extends BaseViewModel<SplashScreenState> {
  SplashScreenViewModel({
    required INavigationService navigationService,
    required IStorageService storage,
    required ApplicationService appService,
    required INetworkService network,
  })  : _navigationService = navigationService,
        _storage = storage,
        _appService = appService,
        _network = network,
        super(const Initialized());

  final INavigationService _navigationService;
  final IStorageService _storage;
  final ApplicationService _appService;
  final INetworkService _network;


  void fetchLoginDetails(BuildContext context) async {
    try {
      final userInfo = _storage.readString(key: PreferencesKeys.sLoginData);
      final rememberUser =
          _storage.readBool(key: PreferencesKeys.sRememberUser);
      if (rememberUser && userInfo.isNotEmpty) {
        navigateToPage(context: context);
      } else {
        _appService.logout();
      }
    } catch (error) {
      navigateToLogin();
    }
  }

  void navigateToPage({
    required BuildContext context,
  }) async {
    await _appService.loadPrefData();

    final customerId = _storage.readString(key: PreferencesKeys.sCustomerId);
    if (customerId.isNotEmpty) {
      final workspaceId =
          _storage.readString(key: PreferencesKeys.sWorkspaceId);
      try {

      } catch (extoException) {
        _appService.logout();
        return;
      }

      if (workspaceId.isNotEmpty) {
        final projectId = _storage.readString(key: PreferencesKeys.projectId);
        if (projectId.isNotEmpty) {
          _appService.updateSelectedNavId(id: NavDrawerItem.projects);
        } else {
          _appService.updateSelectedNavId(id: NavDrawerItem.projects);
        }
      } else {
        _appService.updateSelectedNavId(id: NavDrawerItem.workspace);
       }
    } else {}
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      _appService.logout();
    });
  }

  Flavor getFlavor() => _appService.state.appConfig.flavor;
}
