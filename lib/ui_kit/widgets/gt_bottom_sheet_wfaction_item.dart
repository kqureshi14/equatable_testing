import 'package:flutter/material.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class BottomSheetWfActionItem extends StatelessWidget {
  const BottomSheetWfActionItem({
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
  static const _bottomMargin = 2.0;
  static const _checkIconSize = 15.0;
  static const _iconBottomPadding = 11.0;
  static const _containerHorizontalMargin = 8.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      margin: const EdgeInsets.only(bottom: _bottomMargin, right: 16, left: 16),
      // decoration: BoxDecoration(
      //   color: _isSelected ? appTheme.colors.workspaceBackground : null,
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child: Row(
        children: [
          const SizedBox(
            width: _iconBottomPadding,
          ),
          GTText(
            _title,
            typography:
                _isSelected ? TypographyFamily.label8 : TypographyFamily.body2R,
            color: appTheme.colors.primaryText,
          ),
          const Spacer(),
          _isSelected
              ? Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.symmetric(
                    horizontal: _containerHorizontalMargin,
                  ),
                  // decoration: BoxDecoration(
                  //   color: appTheme.colors.primaryLeftSideTint,
                  //   shape: BoxShape.circle,
                  // ),
                  child: Icon(
                    Icons.check_sharp,
                    size: _checkIconSize,
                    color: appTheme.colors.unselectedLabel,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
