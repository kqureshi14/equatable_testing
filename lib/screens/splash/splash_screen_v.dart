import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/base/base.dart';
import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/screens/splash/splash_screen_m.dart';
import 'package:equatable_testing/screens/splash/splash_screen_vm.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

@RoutePage()
class SplashScreen extends BaseView<SplashScreenViewModel> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final _screenSize = screenSizeData.size;
    final _logoWidth = _screenSize.width * .3;

    viewModel.fetchLoginDetails(context);
    return BlocBuilder<SplashScreenViewModel, SplashScreenState>(
      bloc: viewModel,
      builder: (_, state) {
        return Scaffold(
          body: state.isRootedDevice
              ? _showExitDialog(context)
              : Center(
                  child: SvgPicture.asset(
                          Resources.appIcon,
                          width: _logoWidth,
                        ),
                ),
        );
      },
    );
  }

  Widget _showExitDialog(BuildContext context) {
    return GTDialog(
      width: double.maxFinite,
      dialogStyle: ExtoComponentStyle.error,
      title: Strings.warning,
      body: const Text(Strings.rootMessage),
      actions: [
        DialogAction(
          type: DialogActionType.ok,
          isBusy: false,
          title: Strings.quit,
          onAction: () async {
            await SystemChannels.platform.invokeMethod<void>(
              'SystemNavigator.pop',
            );
          },
          buttonKind: ButtonType.button,
          buttonStyleType: ButtonStyleType.outline,
        ),
      ],
      alignment: Alignment.center,
    );
  }
}
