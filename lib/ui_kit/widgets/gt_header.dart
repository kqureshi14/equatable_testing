import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/theme/app_theme_widget.dart';
import 'package:equatable_testing/ui_kit/widgets/gt_text.dart';
import 'package:equatable_testing/constants/resources.dart';
import 'package:equatable_testing/theme/app_theme_data/app_theme_data.dart';
import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/constants/strings.dart';
import 'package:equatable_testing/services/application_state.dart';
import 'package:equatable_testing/services/navigation/navigation.dart';
import 'package:equatable_testing/helpers/connectivity_helper.dart';

import 'package:equatable_testing/screens/net_bloc/network_bloc.dart';
import 'package:equatable_testing/screens/net_bloc/network_state.dart';

class GTHeader extends StatefulWidget {
  const GTHeader({
    required String title,
    required String navigateTo,
    required GlobalKey<ScaffoldState> scaffoldKey,
    bool isTablet = false,
    List<Widget> actions = const [],
    Key? key,
  })  : _title = title,
        _navigateTo = navigateTo,
        _scaffoldKey = scaffoldKey,
        _isTablet = isTablet,
        _actions = actions,
        super(key: key);

  final String _title;
  final String _navigateTo;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final bool _isTablet;
  final List<Widget> _actions;
  @override
  State<GTHeader> createState() => _GTHeaderState();
}

class _GTHeaderState extends State<GTHeader> {
  static const _tabletTopPadding = 53.0;
  static const _tabletBottomPadding = 4.0;
  static const _mobileTopPadding = 32.0;
  static const _mobileLeftPadding = 22.0;
  static const _mobileRightPadding = 24.0;
  static const _mobileBottomPadding = 20.0;
  static const _mobileIconLeftPadding = 5.0;
  static const _mobileDrawerIconSize = 36.0;
  static const _mobileCircleAvatarSize = 12.0;
  static const _mobileMenuIconWidth = 18.0;
  static const _iconBottomPadding = 11.0;

  final connectivity = ConnectivityHelper.getInstance();
  ValueNotifier<bool> showConnectionStatus = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    showConnectionStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return _headerTitle(
      appTheme: appTheme,
      isTablet: widget._isTablet,
      context: context,
    );
  }

  Widget _headerTitle({
    required IAppThemeData appTheme,
    required bool isTablet,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: isTablet ? _tabletTopPadding : _mobileTopPadding,
        bottom: isTablet ? _tabletBottomPadding : _mobileBottomPadding,
        left: isTablet ? _tabletTopPadding : _mobileLeftPadding,
        right: isTablet ? _tabletBottomPadding : _mobileRightPadding,
      ),
      child: Row(
        children: [
          const SizedBox(width: _mobileIconLeftPadding),
          InkWell(
            onTap: () => widget._scaffoldKey.currentState!.openDrawer(),
            child: Container(
              height: _mobileDrawerIconSize,
              width: _mobileDrawerIconSize,
              alignment: Alignment.center,
              decoration: appTheme.workspaceSwitcherDecoration,
              child: SvgPicture.asset(
                Resources.menuIcon,
                height: _mobileCircleAvatarSize,
                width: _mobileMenuIconWidth,
              ),
            ),
          ),
          const SizedBox(width: _iconBottomPadding),
          Expanded(
            flex: 100,
            child: GTText(
              widget._title,
              typography: TypographyFamily.headline5,
            ),
          ),
          BlocBuilder<NetworkBloc, NetworkState>(
            builder: (context, state) {
              return Visibility(
                child: SvgPicture.asset(
                  Resources.offLineIcon,
                  fit: BoxFit.cover,
                  width: 30.0,
                  height: 30.0,
                ),
                visible: state is NetworkFailure,
              );
            },
          ),
          const Spacer(),
          for (var item in widget._actions)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(child: item),
            )
        ],
      ),
    );
  }


  void forwardTo() {
    final _navigation = locateService<INavigationService>();
    if (widget._navigateTo == Strings.workSpace) {
    }
  }

  String displayTitle(BuildContext context) {
    return '';
  }

}
