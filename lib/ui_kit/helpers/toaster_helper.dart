import 'package:equatable_testing/constants/constants.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:equatable_testing/helpers/string_helper.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart' as toastwithoutcontext;

import '../../helpers/enum_helper.dart';

enum ToastType {
  basic,
  success,
  error,
  info,
  warning,
}

enum _ToastActionType {
  ok,
  cancel,
  submit,
  dismiss,
}

class Toaster {
  Toaster._();

  static const _defaultDuration = Duration(seconds: 3);
  static const _toastMargin = 16.0;
  static const _toastPadding = EdgeInsets.only(left: 5, right: 9);
  static const _actionsRightPadding = 10.0;
  static const _dividerHeight = 20.0;
  static const _dividerWidth = 40.0;

  static void showToast({
    required BuildContext context,
    required String message,
    required ToastType toastType,
    String? caption,
    Duration duration = _defaultDuration,
    bool isPositionFixed = false,
    bool hasDismissOption = true,
    bool enableVerticalDismiss = true,
    bool dismissByHorizontalDrag = false,
    bool isWfAction = false,
    FlashPosition? position,
    double? width,
    List<ToastAction>? actions,
  }) {
    final _appTheme = AppTheme.of(context).theme;
    final toastDecorationData = _getDecorationData(
      appTheme: _appTheme,
      toastType: toastType,
    );
    Future.delayed(
      Duration.zero,
      () {
        showFlash(
          context: context,
          duration: !isPositionFixed ? duration : null,
          builder: (
            context,
            controller,
          ) {
            return isWfAction
                ? _showWfActionToast(
                    appTheme: _appTheme,
                    controller: controller,
                    toastType: toastType,
                    message: message,
                  )
                : FlashBar(
                    // horizontalDismissDirection: dismissByHorizontalDrag
                    //     ? HorizontalDismissDirection.horizontal
                    //     : null,
                    behavior: isPositionFixed
                        ? FlashBehavior.fixed
                        : FlashBehavior.floating,
                    position: position ?? FlashPosition.bottom,
                    // enableVerticalDrag: enableVerticalDismiss,
                    // borderRadius: _appTheme.defaultBorderRadius,
                    backgroundColor: toastDecorationData.backgroundColor,
                    controller: controller,
                    margin: const EdgeInsets.all(_toastMargin),
                    content: _buildToastContent(
                      appTheme: _appTheme,
                      controller: controller,
                      decorationData: toastDecorationData,
                      toastType: toastType,
                      message: message,
                      caption: caption,
                      hasDismissOption: hasDismissOption,
                      actions: actions,
                    ),
                  );
          },
        );
      },
    );
  }

  static Widget _showWfActionToast({
    required IAppThemeData appTheme,
    required FlashController controller,
    required ToastType toastType,
    required String message,
  }) {
    return FlashBar(
      controller: controller,
      backgroundColor: appTheme.colors.transparent,
      content: Container(
        margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
        decoration: BoxDecoration(
          color: appTheme.colors.secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(
              toastType == ToastType.success
                  ? Resources.successIcon
                  : Resources.errorIcon,
            ),
            title: GTText(
              toastType == ToastType.success
                  ? Strings.success.capitalize()
                  : Strings.error,
              style: appTheme.typographies.interFontFamily.label7,
            ),
            subtitle: GTText(
              message,
              maxLines: 3,
              style: appTheme.typographies.interFontFamily.caption4.copyWith(
                color: appTheme.colors.defaultTrailingIcon,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => controller.dismiss(),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildToastContent({
    required IAppThemeData appTheme,
    required FlashController controller,
    required _ToastDecorationData decorationData,
    required ToastType toastType,
    required String message,
    required bool hasDismissOption,
    String? caption,
    List<ToastAction>? actions,
  }) {
    return Padding(
      padding: _toastPadding,
      child: FlashBar(
        icon: decorationData.icon,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: RichText(
                text: TextSpan(
                  children: [
                    if (caption != null)
                      TextSpan(
                        text: '$caption  ',
                        style: appTheme.typographies.interFontFamily.label1
                            .copyWith(color: decorationData.captionColor),
                      ),
                    TextSpan(
                      text: message,
                      style: appTheme.typographies.interFontFamily.label1,
                    )
                  ],
                ),
              ),
            ),
            if (actions != null && actions.isNotEmpty)
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: _actionsRightPadding,
                  ),
                  child: _buildActionButtons(
                    actions: actions,
                    decorationData: decorationData,
                  ),
                ),
              )
          ],
        ),
        shouldIconPulse: false,
        primaryAction: hasDismissOption
            ? _buildDismissOption(
                controller: controller,
                decorationData: decorationData,
              )
            : null,
        controller: controller,
      ),
    );
  }

  static Widget _buildDismissOption({
    required FlashController controller,
    required _ToastDecorationData decorationData,
  }) {
    return GestureDetector(
      onTap: () => controller.dismiss(),
      child: Icon(
        Icons.close,
        color: decorationData.secondaryColor,
      ),
    );
  }

  static Widget _buildActionButtons({
    required List<ToastAction> actions,
    required _ToastDecorationData decorationData,
  }) {
    Widget divider = SizedBox(
      height: _dividerHeight,
      child: GTDivider.vertical(
        color: Colors.black,
        width: _dividerWidth,
      ),
    );
    final actionList = <Widget>[];
    for (var action in actions) {
      final index = actions.indexOf(action);
      actionList.add(
        Flexible(
          child: GestureDetector(
            onTap: action.onTap,
            child: GTText(
              action.title,
              color: action.buttonType == ExtoComponentStyle.primary
                  ? decorationData.primaryColor
                  : decorationData.secondaryColor,
            ),
          ),
        ),
      );
      if (index < actions.length - 1) {
        actionList.add(divider);
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: actionList,
    );
  }

  static _ToastDecorationData _getDecorationData({
    required IAppThemeData appTheme,
    required ToastType toastType,
  }) {
    switch (toastType) {
      case ToastType.success:
        return _ToastDecorationData.success(appTheme.colors);
      case ToastType.error:
        return _ToastDecorationData.error(appTheme.colors);
      case ToastType.info:
        return _ToastDecorationData.info(appTheme.colors);
      case ToastType.warning:
        return _ToastDecorationData.warning(appTheme.colors);
      case ToastType.basic:
        return _ToastDecorationData.basic(appTheme.colors);
    }
  }

  static void defaultToast({
    required BuildContext context,
    required String message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
  }) {
    showToast(
      context: context,
      message: message,
      caption: caption,
      toastType: ToastType.basic,
      actions: actions,
      position: position,
    );
  }

  static void successToast({
    required BuildContext context,
    required String message,
    bool isWfAction = false,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
  }) {
    showToast(
      context: context,
      message: message,
      caption: caption,
      toastType: ToastType.success,
      actions: actions,
      position: position,
      isWfAction: isWfAction,
    );
  }

  static void errorToast({
    required BuildContext context,
    required String message,
    bool isWfAction = false,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
  }) {
    showToast(
      context: context,
      message: message,
      caption: caption,
      toastType: ToastType.error,
      actions: actions,
      position: position,
      isWfAction: isWfAction,
    );
  }

  static void infoToast({
    required BuildContext context,
    required String message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
  }) {
    showToast(
      context: context,
      message: message,
      caption: caption,
      toastType: ToastType.info,
      actions: actions,
      position: position,
    );
  }

  static void warningToast({
    required BuildContext context,
    required String message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
  }) {
    showToast(
      context: context,
      message: message,
      caption: caption,
      toastType: ToastType.warning,
      actions: actions,
      position: position,
    );
  }

  static void warningMessageWithoutContext(
    String _text, {
    toastwithoutcontext.Toast toastLength =
        toastwithoutcontext.Toast.LENGTH_SHORT,
    toastwithoutcontext.ToastGravity toastGravity =
        toastwithoutcontext.ToastGravity.CENTER,
    int dismissibleTime = 2,
    MaterialColor backgroundColor = Colors.red,
    Color textColor = Colors.white,
    double textFontSize = 16.0,
  }) {
    toastwithoutcontext.Fluttertoast.showToast(
      msg: _text,
      toastLength: toastLength,
      gravity: toastGravity,
      timeInSecForIosWeb: dismissibleTime,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: textFontSize,
    );
  }
}

class _ToastDecorationData {
  _ToastDecorationData({
    required this.icon,
    required this.backgroundColor,
    required this.captionColor,
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory _ToastDecorationData.success(IColors colors) {
    return _ToastDecorationData(
      icon: Icon(
        Icons.arrow_forward_rounded,
        color: colors.successCaption,
      ),
      backgroundColor: colors.successBackground,
      captionColor: colors.successCaption,
      primaryColor: colors.successDark,
      secondaryColor: colors.successLight,
    );
  }

  factory _ToastDecorationData.error(IColors colors) {
    return _ToastDecorationData(
      icon: Icon(
        Icons.bolt,
        color: colors.errorCaption,
      ),
      backgroundColor: colors.errorBackground,
      captionColor: colors.errorCaption,
      primaryColor: colors.errorDark,
      secondaryColor: colors.errorLight,
    );
  }

  factory _ToastDecorationData.info(IColors colors) {
    return _ToastDecorationData(
      icon: Icon(
        Icons.arrow_forward_rounded,
        color: colors.primaryCaption,
      ),
      backgroundColor: colors.primaryBackground,
      captionColor: colors.primaryCaption,
      primaryColor: colors.primaryDark,
      secondaryColor: colors.primaryLight,
    );
  }

  factory _ToastDecorationData.warning(IColors colors) {
    return _ToastDecorationData(
      icon: Icon(
        Icons.dangerous,
        color: colors.warningCaption,
      ),
      backgroundColor: colors.warningBackground,
      captionColor: colors.warningCaption,
      primaryColor: colors.warningDark,
      secondaryColor: colors.warningLight,
    );
  }

  factory _ToastDecorationData.basic(IColors colors) {
    return _ToastDecorationData(
      icon: Icon(
        Icons.arrow_forward_rounded,
        color: colors.secondaryCaption,
      ),
      backgroundColor: colors.secondaryBackground,
      captionColor: colors.secondaryCaption,
      primaryColor: colors.secondaryDark,
      secondaryColor: colors.secondaryLight,
    );
  }

  final Icon icon;
  final Color backgroundColor;
  final Color captionColor;
  final Color primaryColor;
  final Color secondaryColor;
}

class ToastAction {
  ToastAction({
    required this.title,
    required this.actionType,
    required this.onTap,
    required this.buttonType,
  });

  factory ToastAction.ok({
    required Function()? onTap,
    ExtoComponentStyle buttonType = ExtoComponentStyle.primary,
  }) {
    const type = _ToastActionType.ok;
    return ToastAction(
      title: EnumHelpers.humanize(type),
      actionType: type,
      onTap: onTap,
      buttonType: buttonType,
    );
  }

  factory ToastAction.cancel({
    required Function()? onTap,
    ExtoComponentStyle buttonType = ExtoComponentStyle.secondary,
  }) {
    const type = _ToastActionType.cancel;
    return ToastAction(
      title: EnumHelpers.humanize(type),
      actionType: type,
      onTap: onTap,
      buttonType: buttonType,
    );
  }

  factory ToastAction.submit({
    required Function()? onTap,
    ExtoComponentStyle buttonType = ExtoComponentStyle.primary,
  }) {
    const type = _ToastActionType.submit;
    return ToastAction(
      title: EnumHelpers.humanize(type),
      actionType: type,
      onTap: onTap,
      buttonType: buttonType,
    );
  }

  factory ToastAction.dismiss({
    required Function()? onTap,
    ExtoComponentStyle buttonType = ExtoComponentStyle.secondary,
  }) {
    const type = _ToastActionType.dismiss;
    return ToastAction(
      title: EnumHelpers.humanize(type),
      actionType: type,
      onTap: onTap,
      buttonType: buttonType,
    );
  }

  final String title;
  final _ToastActionType actionType;
  final Function()? onTap;
  final ExtoComponentStyle buttonType;
}
