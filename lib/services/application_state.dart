import 'dart:convert';
import 'package:equatable_testing/services/navigation/navigation.dart';
import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable_testing/app_config.dart';
import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/helpers/enum_helper.dart';

import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:equatable_testing/services/services.dart';

import '../models/access_token/access_token_data.dart';
import '../models/login/login_response.dart';

class ApplicationState extends Equatable {
  const ApplicationState({
    required this.appConfig,
    this.baseUrl,
    this.userInfo,
    this.accessTokenInfo,
    this.cookie,
    this.tenantId,
    this.workspaceId,
    this.projectId,
    this.customerTokenLegacy,
    this.userFormData,
    this.selectedNavId,
    this.searchVisible = true,
  });

  final AppConfig appConfig;
  final LoginResponse? userInfo;
  final AccessTokenData? accessTokenInfo;
  final String? cookie;
  final String? tenantId;
  final String? workspaceId;
  final String? baseUrl;
  final String? projectId;
  final String? customerTokenLegacy;
  final Map<String, dynamic>? userFormData;
  final NavDrawerItem? selectedNavId;
  final bool? searchVisible;

  ApplicationState copyWith({
    AppConfig? appConfig,
    LoginResponse? userInfo,
    AccessTokenData? accessTokenInfo,
    String? cookie,
    String? baseUrl,
    String? projectId,
    String? workspaceId,
    String? tenantId,
    String? customerTokenLegacy,
    Map<String, dynamic>? userFormData,
    NavDrawerItem? selectedNavId,
    bool? searchVisible,
    bool? checkListStatus,
  }) {
    return ApplicationState(
      appConfig: appConfig ?? this.appConfig,
      userInfo: userInfo ?? this.userInfo,
      accessTokenInfo: accessTokenInfo ?? this.accessTokenInfo,
      cookie: cookie ?? this.cookie,
      baseUrl: baseUrl ?? this.baseUrl,
      tenantId: tenantId ?? this.tenantId,
      projectId: projectId ?? this.projectId,
      customerTokenLegacy: customerTokenLegacy ?? this.customerTokenLegacy,
      userFormData: userFormData ?? this.userFormData,
      workspaceId: workspaceId ?? this.workspaceId,
      selectedNavId: selectedNavId ?? this.selectedNavId,
      searchVisible: searchVisible ?? this.searchVisible,
    );
  }

  @override
  List<Object?> get props => [
        userInfo,
        baseUrl,
        tenantId,
        projectId,
        customerTokenLegacy,
        userFormData,
        workspaceId,
        selectedNavId,
        searchVisible,
      ];
}

class ApplicationService extends Cubit<ApplicationState> {
  ApplicationService({
    required INavigationService navigation,
    required IStorageService storage,
    required AppConfig appConfig,
  })  : _navigation = navigation,
        _storage = storage,
        super(ApplicationState(appConfig: appConfig));

  final INavigationService _navigation;
  final IStorageService _storage;

  Future<void> loadPrefData() async {
    final baseURL = _storage.readString(key: PreferencesKeys.sBaseUrl);
    final loginInfo = _storage.readString(key: PreferencesKeys.sLoginData);
    final projectId = _storage.readString(key: PreferencesKeys.projectId);
    final tenantId = _storage.readString(key: PreferencesKeys.sTenantId);
    final workspaceId = _storage.readString(key: PreferencesKeys.sWorkspaceId);

    final customerTokenLegacy = _storage.readString(
      key: PreferencesKeys.sCustomerTokenLegacy,
    );
    final _accessTokenInfo = _storage.readString(
      key: PreferencesKeys.sAccessTokenData,
    );
    var userInfo = LoginResponse.fromJson(jsonDecode(loginInfo));

    final _isSSOLogin = _storage.readBool(key: PreferencesKeys.sIsSSOLogin);
    var accessTokenInfo = AccessTokenData.empty();
    var cookie = '';
    if (!_isSSOLogin) {
      if (_accessTokenInfo != '') {
        accessTokenInfo =
            AccessTokenData.fromJson(jsonDecode(_accessTokenInfo));
      }
    } else {
      cookie = _storage.readString(key: PreferencesKeys.sCookie);
    }

    emit(
      state.copyWith(
        baseUrl: baseURL,
        userInfo: userInfo,
        accessTokenInfo: accessTokenInfo,
        cookie: cookie,
        projectId: projectId,
        tenantId: tenantId,
        workspaceId: workspaceId,
        customerTokenLegacy: customerTokenLegacy,
      ),
    );
  }

  String getBaseUrl({String baseUrl = ''}) {
    if (baseUrl.isEmpty) {
      var _baseUrl = _storage.readString(key: PreferencesKeys.sBaseUrl);
      if (_baseUrl.isEmpty) {
        _baseUrl = baseUrl.isEmpty ? state.appConfig.baseUrl : baseUrl;
      }
      return _baseUrl;
    }
    return baseUrl;
  }

  void updateUserInfo({required LoginResponse loginResponse}) {
    emit(state.copyWith(userInfo: loginResponse));
  }

  void updateSelectedNavId({required NavDrawerItem id}) {
    emit(state.copyWith(selectedNavId: id));
  }

  void updateAccessToken(AccessTokenData accessTokenInfo) {
    emit(state.copyWith(accessTokenInfo: accessTokenInfo));
  }

  void updateProjectId(String projectId) {
    emit(state.copyWith(projectId: projectId));
  }

  void clearUserInfo() {
    emit(
      state.copyWith(
        userInfo: LoginResponse.empty(),
        tenantId: '',
        projectId: '',
        customerTokenLegacy: '',
        userFormData: {},
        workspaceId: '',
        accessTokenInfo: AccessTokenData.empty(),
        baseUrl: '',
        searchVisible: true,
        checkListStatus: true,
      ),
    );
  }

  void logout() async {
    final _baseUrl = getBaseUrl();
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      clearUserInfo();
      await _storage.clear();

      ///This is to retain the previous scanned base url
      await _storage.writeString(
        key: PreferencesKeys.sBaseUrl,
        data: _baseUrl,
      );
    }

    _navigation.replaceAll(route: [ const EquatableDemo()]);
  }

  Future<bool> logoutPopUp(BuildContext context) async {
    await DialogHelper.confirmationDialog(
      context: context,
      confirmationMessage: Strings.logoutApplication,
      onConfirm: () => logout(),
      onDeny: () {
        _navigation.pop();
      },
    );
    return Future.value(false);
  }
}
