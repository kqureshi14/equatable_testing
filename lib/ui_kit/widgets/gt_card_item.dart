import 'package:equatable_testing/helpers/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class GTCardItem extends StatelessWidget {
  const GTCardItem({
    required String title,
    required String subtitle,
    String? heroText,
    Color? leadingWidgetBackground,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    ShapeBorder? cardShape,
    SvgPicture? svgPicture,
    double padding = 24.0,
    Key? key,
  })  : _title = title,
        _subtitle = subtitle,
        _heroText = heroText,
        _leadingWidgetBackground = leadingWidgetBackground,
        _titleStyle = titleStyle,
        _subtitleStyle = subtitleStyle,
        _cardShape = cardShape,
        _svgPicture = svgPicture,
        _padding = padding,
        super(key: key);

  final String _title;
  final String? _heroText;
  final Color? _leadingWidgetBackground;
  final TextStyle? _titleStyle;
  final TextStyle? _subtitleStyle;
  final String _subtitle;
  final ShapeBorder? _cardShape;
  final SvgPicture? _svgPicture;
  final double _padding;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Card(
      shape: _cardShape ?? appTheme.cardBorder,
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: GTPlaceholder(
            title: _heroText ?? _title.getShortName(),
            color: _leadingWidgetBackground,
          ),
          title: GTText(
            _title,
            style: _titleStyle,
          ),
          subtitle: GTText(
            _subtitle,
            style: _subtitleStyle,
          ),
          trailing: _svgPicture,
        ),
      ),
    );
  }
}
