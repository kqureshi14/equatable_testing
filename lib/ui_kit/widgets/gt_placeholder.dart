import 'package:flutter/material.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class GTPlaceholder extends StatelessWidget {
  const GTPlaceholder({
    required String title,
    double size = 52.0,
    Color? color,
    BoxDecoration? decoration,
    TextStyle? style,
    Key? key,
  })  : _title = title,
        _color = color,
        _size = size,
        _decoration = decoration,
        _style = style,
        super(key: key);

  final String _title;
  final Color? _color;
  final double _size;
  final BoxDecoration? _decoration;
  final TextStyle? _style;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Container(
      width: _size,
      height: _size,
      decoration: _decoration ??
          BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(8),
          ),
      child: Center(
        child: GTText(
          _title,
          style: _style ??
              appTheme.typographies.interFontFamily.label2.copyWith(
                color: appTheme.colors.secondaryBackground,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
