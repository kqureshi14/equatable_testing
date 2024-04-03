import 'package:flutter/material.dart';

import 'package:equatable_testing/base/base.dart';
import 'package:equatable_testing/services/services.dart';

import 'package:equatable_testing/setup.dart';

abstract class BaseStatefulView<C extends BaseState, M extends BaseViewModel>
    extends ResponsiveStatefulWidget {
  BaseStatefulView({
    Key? key,
    C? controller,
  })  : _controller = controller,
        super(
          deviceService: locateService<IDeviceService>(),
          key: key,
        ) {
    _viewModel = locateService<M>();
  }
  late final M _viewModel;
  final C? _controller;
  M get viewModel => _viewModel;
  C? get controller => _controller;
}

abstract class BaseStatefulState<T extends BaseStatefulView> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreen(
      context: context,
      screenSizeData: locateService<IDeviceService>().screenSizeData(),
    );
  }

  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  });
}
