import 'package:flutter/material.dart';

import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class GTLabelContainer extends StatelessWidget {
  const GTLabelContainer({
    required bool isReadOnly,
    required bool isMandatory,
    required bool hideLabel,
    required String label,
    required Widget child,
    String? helpText,
    Key? key,
  })  : _isMandatory = isMandatory,
        _isReadOnly = isReadOnly,
        _hideLabel = hideLabel,
        _helpText = helpText,
        _label = label,
        _child = child,
        super(key: key);

  final bool _isReadOnly;
  final bool _isMandatory;
  final bool _hideLabel;
  final String _label;
  final String? _helpText;
  final Widget _child;

  static const _padding = 8.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    const spacer = SizedBox(height: 8);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _padding),
      child: AbsorbPointer(
        absorbing: _isReadOnly,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!_hideLabel)
              _buildLabel(
                appTheme: appTheme,
                context: context,
              ),
            spacer,
            _child,
            spacer,
            if (_helpText != null && _helpText!.isNotEmpty) _buildHelpText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel({
    required BuildContext context,
    required IAppThemeData appTheme,
  }) =>
      RichText(
        text: TextSpan(
          text: _label,
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            if (_isMandatory)
              TextSpan(
                text: Strings.mandatoryIndicator,
                style: appTheme.typographies
                    .byFontFamily(FontFamily.inter)
                    .label2
                    .copyWith(color: appTheme.colors.errorBackground),
              ),
          ],
        ),
      );
  Widget _buildHelpText() => Padding(
        padding: const EdgeInsets.only(left: _padding),
        child: GTText(
          _helpText!,
          typography: TypographyFamily.label4,
        ),
      );
}
