import 'package:flutter/material.dart';

import 'package:equatable_testing/theme/app_theme_widget.dart';
import 'package:equatable_testing/theme/app_theme_data/app_theme_data.dart';

class GTRichText extends StatelessWidget {
  const GTRichText({
    required String title,
    FontFamily fontFamily = FontFamily.inter,
    TypographyFamily typography = TypographyFamily.body1,
    Color? color,
    String? normalText,
    TextStyle? titleStyle,
    TextStyle? normalTextStyle,
    Icon? icon,
    Key? key,
  })  : _title = title,
        _typography = typography,
        _fontFamily = fontFamily,
        _titleStyle = titleStyle,
        _icon = icon,
        _normalText = normalText,
        _normalTextStyle = normalTextStyle,
        _color = color,
        super(key: key);

  final String _title;
  final TextStyle? _titleStyle;
  final TextStyle? _normalTextStyle;
  final String? _normalText;
  final Icon? _icon;
  final FontFamily _fontFamily;
  final TypographyFamily _typography;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final defaultNormalStyle = appTheme.getTextStyle(
      fontFamily: _fontFamily,
      typographyFamily: _typography,
      color: _color,
    );
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: _title,
            style: _titleStyle ??
                appTheme.typographies.interFontFamily.body2M
                    .copyWith(color: appTheme.colors.tertiaryText),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _icon ?? const SizedBox(width: 3),
          ),
          TextSpan(
            text: _normalText,
            style: _normalTextStyle ?? defaultNormalStyle,
          )
        ],
      ),
    );
  }
}
