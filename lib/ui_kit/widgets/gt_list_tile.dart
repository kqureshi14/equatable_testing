import 'package:flutter/material.dart';

import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class GTListTile extends StatelessWidget {
  const GTListTile({
    required String title,
    required TextStyle textStyle,
    required Function() onTap,
    Widget? leadingIcon,
    bool isSelected = false,
    Color? leadingWidgetBackground,
    double? minimumLeadingWidth,
    EdgeInsets? contentPadding,
    Key? key,
  })  : _title = title,
        _textStyle = textStyle,
        _onTap = onTap,
        _leadingIcon = leadingIcon,
        _isSelected = isSelected,
        _leadingWidgetBackground = leadingWidgetBackground,
        _minimumLeadingWidth = minimumLeadingWidth,
        _contentPadding = contentPadding,
        super(key: key);

  final String _title;
  final TextStyle _textStyle;
  final Function() _onTap;
  final Widget? _leadingIcon;
  final bool _isSelected;
  final Color? _leadingWidgetBackground;
  final double? _minimumLeadingWidth;
  final EdgeInsets? _contentPadding;

  @override
  Widget build(BuildContext context) {
    final _appTheme = locateService<IAppThemeData>();
    return ListTile(
      onTap: _onTap,
      dense: true,
      minLeadingWidth: _minimumLeadingWidth,
      contentPadding: _contentPadding,
      leading: _leadingIcon ??
          CircleAvatar(
            backgroundColor: _leadingWidgetBackground,
            child: GTText(
              _title,
              style: _textStyle.copyWith(
                color: _appTheme.colors.secondaryBackground,
              ),
            ),
          ),
      title: GTText(
        _title,
        style: _textStyle,
      ),
      trailing: _isSelected
          ? Icon(
              Icons.check_circle,
              color: _appTheme.colors.primaryBackground,
            )
          : null,
    );
  }
}
