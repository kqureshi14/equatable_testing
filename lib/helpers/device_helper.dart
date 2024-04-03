import 'package:flutter/material.dart';

import 'package:equatable_testing/services/services.dart';

class DeviceHelper {
  static const _minimumWidth = 550;

  static ScreenSizeData screenSizeData() {
    final _data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);
    final _screenType = _data.size.shortestSide < _minimumWidth
        ? ScreenType.small
        : ScreenType.medium;

    return ScreenSizeData(
      size: _data.size,
      screenType: _screenType,
    );
  }
}
