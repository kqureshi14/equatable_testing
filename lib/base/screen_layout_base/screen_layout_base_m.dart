import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:equatable_testing/base/base.dart';

part 'screen_layout_base_m.freezed.dart';

@freezed
class ScreenLayoutBaseState extends BaseState with _$ScreenLayoutBaseState {
  const factory ScreenLayoutBaseState.initialized() = Initialized;
  const factory ScreenLayoutBaseState.loaded() = Loaded;
}
