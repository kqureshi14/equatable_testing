import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/services/device/device_service.dart';
import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/ui_kit/widgets/gt_search_bar.dart';
import 'package:equatable_testing/base/screen_layout_base/screen_layout_base_m.dart';
import 'package:equatable_testing/base/screen_layout_base/screen_layout_base_vm.dart';
import 'package:equatable_testing/constants/resources.dart';
import 'package:equatable_testing/theme/app_theme_widget.dart';

mixin ScreenLayoutBase on StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const _mobileSearchbarPadding = 4.0;
  static const _tabletSearchbarPadding = 36.0;
  static const _topMobilePadding = 23.0;
  static const _horizontalPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    return buildScreen(
      context: context,
      screenSizeData: locateService<IDeviceService>().screenSizeData(),
    );
  }

  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;
    final viewModel = locateService<ScreenLayoutBaseViewModel>();
    return BlocBuilder<ScreenLayoutBaseViewModel, ScreenLayoutBaseState>(
      bloc: viewModel,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
              child: Container(
                width: screenSizeData.size.width,
                height: screenSizeData.size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                decoration: appTheme.backgroundGradient,
                child: screenSizeData.screenType == ScreenType.small
                    ? _buildMobileView(
                        context: context,
                        screenSizeData: screenSizeData,
                        state: state,
                        viewModel: viewModel,
                      )
                    : _buildTabletView(
                        context: context,
                        screenSizeData: screenSizeData,
                        state: state,
                        viewModel: viewModel,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileView({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
    required ScreenLayoutBaseViewModel viewModel,
    required ScreenLayoutBaseState state,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: _mobileSearchbarPadding,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: _topMobilePadding,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () => viewModel.backTo(),
                child: SvgPicture.asset(
                  Resources.backArrowTopIcon,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 13,
              ),

            ],
          ),
        ),
        Expanded(
          child: body(
            context,
            screenSizeData,
          ),
        ),
      ],
    );
  }

  Widget _buildTabletView({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
    required ScreenLayoutBaseViewModel viewModel,
    required ScreenLayoutBaseState state,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: _tabletSearchbarPadding,
        ),
        _extoSearchBar(
          isTablet: true,
          context: context,
          state: state,
          viewModel: viewModel,
        ),
        Expanded(
          child: body(
            context,
            screenSizeData,
          ),
        )
      ],
    );
  }

  Widget _extoSearchBar({
    required bool isTablet,
    required BuildContext context,
    required ScreenLayoutBaseViewModel viewModel,
    required ScreenLayoutBaseState state,
  }) {
    return GTSearchBar(
      displayHintSearch: viewModel.getSearchVisiblity(),
      onChanged: (value) => onSearchChange(value),
      prefixIcon: SvgPicture.asset(
        Resources.menuIcon,
        height: 12,
      ),
      prefixIconOnTap: () {
        _scaffoldKey.currentState!.openDrawer();
      },
      suffixIconOnTap: () async {
        await suffixIconTap(context);
        //viewModel.fetchPreSelectedWorkspace(context);
      },

    );
  }

  Widget body(
    BuildContext context,
    ScreenSizeData screenSizeData,
  );

  Future<void> suffixIconTap(BuildContext context);
  void onSearchChange(String value);
}
