import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class GTListItem extends StatelessWidget {
  const GTListItem({
    required String title,
    String? subTitle,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    SvgPicture? svgPicture,
    SvgPicture? leadingSvgPicture,
    SvgPicture? suffixSvgPicture,
    Color? leadingWidgetBackground,
    Function? onTap,
    double padding = 24.0,
    double minLeadingWidth = 15.0,
    double heightOfSizeBox = 55.0,
    bool isDividerDisplay = true,
    double topPadding = 18,
    Key? key,
  })  : _title = title,
        _subTitle = subTitle,
        _titleStyle = titleStyle,
        _subTitleStyle = subTitleStyle,
        _svgPicture = svgPicture,
        _leadingSvgPicture = leadingSvgPicture,
        _suffixSvgPicture = suffixSvgPicture,
        _leadingWidgetBackground = leadingWidgetBackground,
        _onTap = onTap,
        _padding = padding,
        _minLeadingWidth = minLeadingWidth,
        _heightOfSizeBox = heightOfSizeBox,
        _isDividerDisplay = isDividerDisplay,
        _topPadding = topPadding,
        super(key: key);

  final String _title;
  final String? _subTitle;
  final TextStyle? _titleStyle;
  final TextStyle? _subTitleStyle;
  final SvgPicture? _svgPicture;
  final SvgPicture? _leadingSvgPicture;
  final SvgPicture? _suffixSvgPicture;
  final Color? _leadingWidgetBackground;
  final Function? _onTap;
  final double _padding;
  final double _minLeadingWidth;
  final double _heightOfSizeBox;
  final bool _isDividerDisplay;
  final double _topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _padding,
        right: _padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _heightOfSizeBox,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              onTap: () => _onTap?.call(),
              minLeadingWidth: _minLeadingWidth,
              title: Padding(
                padding: EdgeInsets.only(top: _topPadding),
                child: GTText(
                  _title,
                  style: _titleStyle,
                ),
              ),
              subtitle: GTText(
                _subTitle ?? '',
                style: _subTitleStyle,
              ),
              leading: _leadingWidgetBackground != null
                  ? SizedBox(
                      child: GTHero.smallText(
                        text: '',
                        isShapeSquare: true,
                        backgroundColor: _leadingWidgetBackground,
                      ),
                    )
                  : _leadingSvgPicture,
              trailing: _svgPicture,
            ),
          ),
          _isDividerDisplay ? const Divider(thickness: 1.5) : const SizedBox(),
        ],
      ),
    );
  }
}
