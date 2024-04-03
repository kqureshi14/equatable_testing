import 'package:flutter/material.dart';

import 'package:equatable_testing/theme/app_theme_data/app_theme_data.dart';
import 'package:equatable_testing/theme/app_theme_widget.dart';
import 'package:equatable_testing/ui_kit/widgets/gt_text.dart';

class GTProfileAppBar extends StatelessWidget {
  const GTProfileAppBar({
    required String title,
    required VoidCallback onClick,
    Key? key,
  })  : _title = title,
        _onClick = onClick,
        super(key: key);

  final String _title;
  final VoidCallback _onClick;

  static const iconSize = 20.0;
  static const iconleftPadding = 29.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Stack(
      children: [
        Align(
          child: GTText(
            _title,
            typography: TypographyFamily.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: iconleftPadding),
            child: InkWell(
              onTap: _onClick,
              child: Icon(
                Icons.arrow_back,
                size: iconSize,
                color: appTheme.colors.mainBlack100,
              ),
            ),
          ),
        )
      ],
    );
  }
}
