import 'package:flutter/material.dart';

import 'package:equatable_testing/services/services.dart';

abstract class ResponsiveStatefulWidget extends StatefulWidget {
  const ResponsiveStatefulWidget({
    required IDeviceService deviceService,
    Key? key,
  })  : _deviceService = deviceService,
        super(key: key);

  final IDeviceService _deviceService;
}

abstract class ResponsiveWidgetState<T extends ResponsiveStatefulWidget>
    extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreen(
      context: context,
      screenSizeData: widget._deviceService.screenSizeData(),
    );
  }

  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  });
}
