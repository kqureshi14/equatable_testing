import 'package:flutter/material.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class BottomSheetDateFormatItem extends StatelessWidget {
  const BottomSheetDateFormatItem({
    required bool isSelected,
    required String title,
    Key? key,
  })  : _isSelected = isSelected,
        _title = title,
        super(key: key);

  final bool _isSelected;
  final String _title;

  static const _verticalPadding = 12.0;
  static const _horizontalPadding = 16.0;
  static const _primaryPadding = 24.0;
  static const _checkIconSize = 15.0;
  static const _dividerHeight = 1.0;
  static const _colorOpacity = 0.04;
  static const _textOpacity = 0.7;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
      ),
      margin: const EdgeInsets.only(
        bottom: _verticalPadding,
        left: _primaryPadding,
        right: _primaryPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              GTText(
                _title,
                typography: TypographyFamily.body2R,
                color: _isSelected
                    ? appTheme.colors.primaryText
                    : appTheme.colors.primaryText.withOpacity(_textOpacity),
              ),
              const Spacer(),
              if (_isSelected)
                Icon(
                  Icons.check_sharp,
                  size: _checkIconSize,
                  color: appTheme.colors.lightPrimaryBackground,
                )
            ],
          ),
          const SizedBox(height: _verticalPadding),
          GTDivider(
            height: _dividerHeight,
            color: appTheme.colors.primary.withOpacity(_colorOpacity),
          )
        ],
      ),
    );
  }
}
