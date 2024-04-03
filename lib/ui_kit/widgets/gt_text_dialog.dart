import 'package:flutter/material.dart';

import 'package:equatable_testing/constants/strings.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:equatable_testing/theme/app_theme_widget.dart';

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
  dynamic inputType,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
        inputType: inputType,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  const TextDialogWidget({
    required this.title,
    required this.value,
    this.inputType,
    Key? key,
  }) : super(key: key);
  final String title;
  final String value;
  final dynamic inputType;

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextController controller;

  @override
  void initState() {
    super.initState();
    controller = TextController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return AlertDialog(
      title: GTText(widget.title),
      content: GTTextInput(
        controller: controller,
        inputType:
            widget.inputType != null ? (widget.inputType)! : InputType.text,
        valueStyle: appTheme.typographies.interFontFamily.body2M,
        hintStyle: appTheme.typographies.interFontFamily.body2R,
        errorBorder: appTheme.errorBorder,
        focusedBorder: appTheme.focusedBorder,
        enabledBorder: appTheme.enabledBorder,
      ),
      actions: [
        GTButton(
          title: Strings.workflowDoneText,
          onTap: () => Navigator.of(context).pop(controller.text),
          isEnable: true,
          isBusy: false,
          buttonType: ButtonType.button,
        ),
      ],
    );
  }
}
