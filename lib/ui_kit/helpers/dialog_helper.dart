import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:equatable_testing/services/navigation/navigation_service.dart';
import 'package:equatable_testing/setup.dart';

abstract class DialogHelper {
  static void show<T>({
    required BuildContext context,
    String? title,
    String? barrierLabel,
    List<DialogAction>? actions,
    Widget? body,
    Widget? header,
    Widget? image,
    double? maxHeight,
    double? width,
    bool isDismissible = true,
    bool? isEnable,
    Alignment? alignment,
    bool Function()? canDismiss,
    ExtoComponentStyle dialogType = ExtoComponentStyle.primary,
  }) {
    assert(
      !isDismissible || barrierLabel != null,
      'barrierLabel must be provided when dialog is dismissible',
    );
    showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: barrierLabel,
      pageBuilder: (context, _, __) {
        return WillPopScope(
          onWillPop: () {
            if (canDismiss != null) {
              return Future.value(canDismiss.call());
            } else {
              return Future.value(true);
            }
          },
          child: GTDialog(
            header: header,
            title: title,
            body: body,
            actions: actions,
            image: image,
            maxHeight: maxHeight,
            width: width,
            isEnable: isEnable ?? true,
            alignment: alignment ?? Alignment.center,
            dialogStyle: dialogType,
          ),
        );
      },
    );
  }

  static Future<dynamic> confirmationDialog({
    required BuildContext context,
    void Function()? onConfirm,
    void Function()? onDeny,
    String? confirmationMessage,
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const GTText(Strings.confirmationTitle),
        content: GTText(
          confirmationMessage ?? Strings.confirmMessage,
          maxLines: 3,
        ),
        actions: <Widget>[
          GTButton.button(
            title: Strings.no,
            height: 40,
            styleType: ButtonStyleType.outline,
            onTap: onDeny ?? locateService<INavigationService>().pop,
          ),
          GTButton.button(
            title: Strings.yes,
            height: 40,
            onTap: onConfirm,
          ),
        ],
      ),
    );
  }

  static Future<dynamic> showBottomSheetDialog({
    required BuildContext context,
    required Widget body,
    double borderRadius = 16.0,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      enableDrag: enableDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      builder: (_) => body,
    );
  }

  static Future<dynamic> showDate(
    BuildContext context,
    DateTime _initialDate,
    DateTime _firstDate,
    DateTime _lastDate,
  ) {
    return showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: _firstDate,
      lastDate: _lastDate,
    );
  }

  static Future<dynamic> showDateAndTime(
    BuildContext context,
    DateTime _initialDate,
    DateTime _firstDate,
    DateTime _lastDate, {
    ValueChanged<String>? onConfirm,
    ValueChanged<String>? onChanged,
  }) {
    return DatePickerBdaya.showDateTimePicker(
      context,
      minTime: _firstDate,
      maxTime: _lastDate,
      onChanged: (date) {
        onChanged?.call(
          date.toString(),
        );
      },
      onConfirm: (date) {
        onConfirm?.call(
          date.toString(),
        );
      },
    );
  }
}
