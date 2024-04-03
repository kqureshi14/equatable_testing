import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:equatable_testing/base/base.dart';

part 'login_screen_m.freezed.dart';

@freezed
class LoginScreenState extends BaseState with _$LoginScreenState {
  const factory LoginScreenState.initialized({
    required String appVersion,
    required String baseURL,
    required int baseUrlIndex,
    required bool isBusy,
    @Default(true) bool rememberMe,
    @Default('') String errorMessage,
  }) = Initialized;
}
