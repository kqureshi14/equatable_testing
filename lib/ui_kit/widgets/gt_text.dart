import 'package:flutter/material.dart';

import 'package:equatable_testing/theme/app_theme_data/app_theme_data.dart';
import 'package:equatable_testing/theme/app_theme_widget.dart';

class GTText extends StatelessWidget {
  const GTText(
    String text, {
    FontFamily fontFamily = FontFamily.inter,
    TypographyFamily typography = TypographyFamily.body1,
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    bool applyOverFlowEllipsis = true,
    Key? key,
  })  : _text = text,
        _typography = typography,
        _fontFamily = fontFamily,
        _color = color,
        _style = style,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _applyOverFlowEllipsis = applyOverFlowEllipsis,
        super(key: key);

  final String _text;
  final FontFamily _fontFamily;
  final TypographyFamily _typography;
  final Color? _color;
  final TextStyle? _style;
  final TextAlign? _textAlign;
  final int? _maxLines;
  final bool _applyOverFlowEllipsis;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final defaultStyle = appTheme.getTextStyle(
      fontFamily: _fontFamily,
      typographyFamily: _typography,
      color: _color,
    );
    return Text(
      _text,
      maxLines: _maxLines,
      style: _style ?? defaultStyle,
      overflow:
          _applyOverFlowEllipsis ? TextOverflow.ellipsis : TextOverflow.visible,
      textAlign: _textAlign,
    );
  }
}
