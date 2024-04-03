import 'package:flutter/material.dart';
import 'package:equatable_testing/constants/strings.dart';
import 'package:equatable_testing/theme/app_theme_data/app_theme_data.dart';
import 'package:equatable_testing/theme/app_theme_widget.dart';
import 'package:equatable_testing/ui_kit/widgets/gt_text.dart';

class GTEmptyIndicator extends StatelessWidget {
  const GTEmptyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Center(
      child: GTText(
        Strings.emptyData,
        typography: TypographyFamily.headline4,
        color: appTheme.colors.defaultText,
      ),
    );
  }
}
