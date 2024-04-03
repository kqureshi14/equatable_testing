import 'package:flutter/material.dart';

import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/helpers/string_helper.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

import '../../models/password_change.dart';


class GTPasswordBottomSheet extends StatefulWidget {
  const GTPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  State<GTPasswordBottomSheet> createState() =>
      _GTPasswordBottomSheetState();
}

class _GTPasswordBottomSheetState extends State<GTPasswordBottomSheet> {
  static const _containerHeight = 490.0;
  static const _mainSize = 16.0;

  final _size8 = 8.0;
  final _size20 = 20.0;
  final _size24 = 24.0;

  final _opacity = 0.32;

  final TextController _passwordController = TextController();
  final TextController _newPasswordController = TextController();
  final TextController _confirmPasswordController = TextController();

  final ValueNotifier<bool> enableResetButton = ValueNotifier(false);

  @override
  void dispose() {
    enableResetButton.dispose();
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final navigator = locateService<INavigationService>();
    final hintStyle = appTheme.typographies.interFontFamily.body1.copyWith(
      color: appTheme.colors.primary.withOpacity(_opacity),
    );
    final valueStyle = appTheme.typographies.interFontFamily.body1
        .copyWith(color: appTheme.colors.primary);
    return Container(
      height: _containerHeight + MediaQuery.of(context).viewInsets.bottom,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_mainSize),
        color: appTheme.colors.secondaryBackground,
      ),
      padding: EdgeInsets.only(
        right: _size24,
        left: _size24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: _mainSize,
            ),
            _getHeader(
              appTheme: appTheme,
              navigator: navigator,
            ),
            const GTText(
              Strings.currentPassword,
              typography: TypographyFamily.label2,
            ),
            SizedBox(
              height: _size8,
            ),
            GTTextInput(
              controller: _passwordController,
              inputType: InputType.password,
              backgroundColor: appTheme.colors.secondaryBackground,
              errorBorder: appTheme.errorBorder,
              focusedBorder: appTheme.focusedBorder,
              enabledBorder: appTheme.enabledBorder,
              hint: Strings.currentPasswordHint,
              hintStyle: hintStyle,
              valueStyle: valueStyle,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {},
              onChanged: (newValue) {},
            ),
            SizedBox(
              height: _size20,
            ),
            const GTText(
              Strings.newPassword,
              typography: TypographyFamily.label2,
            ),
            SizedBox(
              height: _size8,
            ),
            GTTextInput(
              controller: _newPasswordController,
              inputType: InputType.password,
              backgroundColor: appTheme.colors.secondaryBackground,
              errorBorder: appTheme.errorBorder,
              focusedBorder: appTheme.focusedBorder,
              enabledBorder: appTheme.enabledBorder,
              hint: Strings.newPasswordHint,
              hintStyle: hintStyle,
              valueStyle: valueStyle,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value?.passwordValidation(),
              onChanged: (newValue) {
                enableResetButton.value =
                    newValue.isNotEmpty.toString().isPasswordValid(newValue) &&
                        _confirmPasswordController.text.isNotEmpty
                            .toString()
                            .isPasswordValid(_confirmPasswordController.text);
              },
            ),
            const SizedBox(height: _mainSize),
            const GTText(
              Strings.confirmPassword,
              typography: TypographyFamily.label2,
            ),
            SizedBox(
              height: _size8,
            ),
            GTTextInput(
              controller: _confirmPasswordController,
              inputType: InputType.password,
              backgroundColor: appTheme.colors.secondaryBackground,
              errorBorder: appTheme.errorBorder,
              focusedBorder: appTheme.focusedBorder,
              enabledBorder: appTheme.enabledBorder,
              hint: Strings.confirmPasswordHint,
              hintStyle: hintStyle,
              valueStyle: valueStyle,
              onChanged: (newValue) {
                enableResetButton.value =
                    newValue.isNotEmpty.toString().isPasswordValid(newValue) &&
                        _newPasswordController.text.isNotEmpty
                            .toString()
                            .isPasswordValid(_newPasswordController.text);
              },
              validator: (text) {
                return text == ''
                    ? null
                    : _confirmPasswordController.text !=
                            _newPasswordController.text
                        ? Strings.passwordMismatch
                        : null;
              },
            ),
            SizedBox(
              height: _size24,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: enableResetButton,
              builder: (context, value, child) => GTButton.button(
                title: Strings.resetPassword,
                width: double.infinity,
                isEnable: value,
                onTap: () {
                  if (_passwordController.text.isNotEmpty &&
                      _newPasswordController.text.isNotEmpty &&
                      _confirmPasswordController.text.isNotEmpty) {

                  } else {
                    Toaster.errorToast(
                      context: context,
                      message: Strings.emptyFields,
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: _size24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader({
    required IAppThemeData appTheme,
    required INavigationService navigator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(_mainSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GTText(
                Strings.changePassword,
                color: appTheme.colors.defaultText,
                typography: TypographyFamily.headline5,
              ),
            ],
          ),
          const SizedBox(height: 4),
          GTText(
            Strings.passwordDescription,
            color: appTheme.colors.unselectedLabel,
            typography: TypographyFamily.label10,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


}
