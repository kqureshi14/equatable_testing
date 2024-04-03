import 'package:flutter/cupertino.dart';

import 'package:equatable_testing/base/base.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/setup.dart';

abstract class BaseView<T extends BaseViewModel> extends ResponsiveWidget {
  BaseView({Key? key})
      : super(
          deviceService: locateService<IDeviceService>(),
          key: key,
        ) {
    _viewModel = locateService<T>();
  }

  late final T _viewModel;

  T get viewModel => _viewModel;
}
