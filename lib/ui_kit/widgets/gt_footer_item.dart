import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/constants/resources.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

class GTFooterItem extends StatelessWidget {
  const GTFooterItem({
    required String title,
    required String subTitle,
    Key? key,
  })  : _title = title,
        _subtitle = subTitle,
        super(key: key);

  final String _title;
  final String _subtitle;

  static const _mobileRadius = 20.0;
  static const _tabRadius = 22.0;

  @override
  Widget build(BuildContext context) {
    final _screenSize = locateService<IDeviceService>().screenSizeData();
    final _appTheme = AppTheme.of(context).theme;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _appTheme.colors.workspaceIcon,
        radius: _screenSize.screenType == ScreenType.small
            ? _mobileRadius
            : _tabRadius,
        child: SvgPicture.asset(Resources.userProfileIcon),
      ),
      title: GTText(
        _title,
        typography: TypographyFamily.label6,
      ),
      subtitle: GTText(
        _subtitle,
        typography: TypographyFamily.label7,
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
