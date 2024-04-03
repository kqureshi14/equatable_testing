import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:equatable_testing/base/base.dart';

part 'splash_screen_m.freezed.dart';

@freezed
class SplashScreenState extends BaseState with _$SplashScreenState {
  const factory SplashScreenState.initialized({
    @Default(false) bool isRootedDevice,
  }) = Initialized;
}
