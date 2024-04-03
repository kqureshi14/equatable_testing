import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:equatable_testing/app_config.dart';
import 'package:equatable_testing/base/base.dart';
import 'package:equatable_testing/constants/constants.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:equatable_testing/screens/login/login_screen_m.dart';

import '../../models/access_token/access_token_data.dart';
import '../../models/access_token/access_token_request.dart';
import '../../models/access_token/access_token_response.dart';
import '../../models/login/login_response.dart';

@injectable
class LoginScreenViewModel extends BaseViewModel<LoginScreenState> {
  LoginScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(
          const Initialized(
            appVersion: '',
            baseURL: '',
            baseUrlIndex: 0,
            isBusy: false,
          ),
        );

  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  Future<void> loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    emit(state.copyWith(appVersion: packageInfo.version));
  }

  void updateBaseUrl({
    required int selectedUrlIndex,
    required String baseURL,
  }) =>
      emit(
        state.copyWith(
          baseUrlIndex: selectedUrlIndex,
          baseURL: baseURL,
        ),
      );

  void loading({required bool isBusy}) => emit(state.copyWith(isBusy: isBusy));

  bool isValidUrl(String url) => Uri.tryParse(url)?.hasAbsolutePath ?? false;

  String updateUrl(String url) {
    if (!url.endsWith('/')) {
      url += '/';
    }
    return url;
  }

  void onFormValuesChange({
    required ValueNotifier<bool> enableSignInButton,
    String email = '',
    String password = '',
  }) {

  }

  void onCheckRememberMe({required bool value}) =>
      emit(state.copyWith(rememberMe: value));

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final isInputValid = _validateInput(
      email: email,
      password: password,
    );
    if (isInputValid) {
      loading(isBusy: true);

      //define your API access here.
    }
  }

  Future<void> processLogin({
    required BuildContext context,
    required String baseUrl,
    dynamic response,
  }) async {
    await _cacheData(
      context: context,
      loginData: response,
      baseUrl: baseUrl,
    );

    /// Get access token for the user
    await _getAccessToken(
      context,
      LoginResponse.fromJson(jsonDecode(response)).user.tenantId,
    );

    loading(isBusy: false);
  }

  Future<void> _getAccessToken(BuildContext context, String tenantId) async {
    try {
      final _response = await _network.gaurdedPost(
        path: Api.accessToken,
        data: jsonEncode(AccessTokenRequest(tenantId: tenantId).toJson()),
        accessToken: false,
      );
      final _accessTokenJSON = jsonDecode(_response.body);
      final _accessToken = AccessTokenResponse.fromJson(_accessTokenJSON);
      await _storage.writeString(
        key: PreferencesKeys.sAccessToken,
        data: _accessToken.accessToken,
      );
      await _storage.writeString(
        key: PreferencesKeys.sAccessTokenData,
        data: _response.body,
      );
      _appService.updateAccessToken(
        AccessTokenData(
          accessToken: _accessToken.accessToken,
          idToken: _accessToken.idToken,
        ),
      );
    } catch (error) {
      Toaster.errorToast(
        context: context,
        message: error.toString(),
      );
    }
  }

  bool _validateInput({
    required String email,
    required String password,
  }) =>
      email.trim().isNotEmpty && password.trim().isNotEmpty;

  Future<void> _cacheData({
    required BuildContext context,
    required loginData,
    required String baseUrl,
  }) async {
    await _storage.writeBool(
      key: PreferencesKeys.sRememberUser,
      data: state.rememberMe,
    );
    await _storage.writeString(
      key: PreferencesKeys.sLoginData,
      data: loginData.toString(),
    );
    final loginDecodedData = jsonDecode(loginData.toString());
    final currentUser = LoginResponse.fromJson(loginDecodedData);
    await _storage.writeString(
      key: PreferencesKeys.sTenantId,
      data: currentUser.user.tenantId,
    );
    await _storage.writeString(
      key: PreferencesKeys.sBaseUrl,
      data: baseUrl,
    );
    await _appService.loadPrefData();
  }



  String getBaseUrl() => _appService.getBaseUrl(baseUrl: state.baseURL);

  String getAppName() => _appService.state.appConfig.appName;

  Flavor getFlavor() => _appService.state.appConfig.flavor;
}
