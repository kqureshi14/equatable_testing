import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:equatable_testing/base/base.dart';
import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:equatable_testing/screens/login/login_screen_m.dart';
import 'package:equatable_testing/screens/login/login_screen_vm.dart';

@RoutePage()
class LoginScreen
    extends BaseStatefulView<LoginScreenState, LoginScreenViewModel> {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulState<LoginScreen> {
  static const _size4 = 4.0;
  static const _size16 = 16.0;
  static const _size20 = 20.0;
  static const _size24 = 24.0;
  static const _size32 = 32.0;
  static const _size40 = 40.0;
  final TextController _emailController = TextController();
  final TextController _passwordController = TextController();

  final _sizedBox16 = const SizedBox(height: _size16);

  static const _scanIconTabSize = 28.0;
  final ValueNotifier<bool> enableSignInButton = ValueNotifier(false);

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;
    final size = screenSizeData.size;

    return BlocBuilder<LoginScreenViewModel, LoginScreenState>(
      bloc: widget.viewModel..loadAppVersion(),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.colors.secondaryBackground,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  screenSizeData.screenType == ScreenType.small
                      ? _buildMobileView(
                          context: context,
                          state: state,
                          appTheme: appTheme,
                          size: size,
                        )
                      : _buildTabletView(
                          context: context,
                          state: state,
                          appTheme: appTheme,
                          size: size,
                        ),
                  if (state.isBusy) const GTLoading()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileView({
    required BuildContext context,
    required LoginScreenState state,
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVerticalSpace(
          size: size,
          portion: .04,
        ),
        _buildScanButton(
          context: context,
          padding: _size16,
          radius: _size20,
          appTheme: appTheme,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.045,
        ),
        Padding(
          padding: const EdgeInsets.only(left: _size32),
          child: _loginText(appTheme: appTheme),
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.010,
        ),
        Padding(
          padding: const EdgeInsets.only(left: _size32),
          child: _loginContinueText(appTheme: appTheme),
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.010,
        ),

        _buildVerticalSpace(
          size: size,
          portion: 0.043,
        ),
        _buildLoginFormMobile(
          context: context,
          state: state,
          appTheme: appTheme,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _buildSignInOption(
            context: context,
            state: state,
            appTheme: appTheme,
          ),
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _securityPoints(
            appTheme: appTheme,
            style: appTheme.typographies.interFontFamily.label10,
          ),
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.10,
        ),
        _projectName(
          state: state,
          size: size,
          appTheme: appTheme,
        ),
        _versionNumber(
          state: state,
          size: size,
        ),
      ],
    );
  }

  Widget _projectName({
    required LoginScreenState state,
    required Size size,
    required IAppThemeData appTheme,
  }) {
    return Center(
      child: Column(
        children: [
         SvgPicture.asset(
                  Resources.appIcon,
                  fit: BoxFit.cover,
                ),
          _buildVerticalSpace(
            size: size,
            portion: 0.04,
          ),
        ],
      ),
    );
  }

  Widget _versionNumber({
    required LoginScreenState state,
    required Size size,
  }) {
    return Center(
      child: Column(
        children: [
          GTText('${Strings.version} ${state.appVersion}'),
          _buildVerticalSpace(
            size: size,
            portion: 0.04,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginFormMobile({
    required BuildContext context,
    required LoginScreenState state,
    required IAppThemeData appTheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _emailTextField(
            appTheme: appTheme,
            valueStyle: appTheme.typographies.interFontFamily.body2M,
            hintStyle: appTheme.typographies.interFontFamily.body2R,
          ),
        ),
        _sizedBox16,
        const SizedBox(height: _size4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _passwordTextField(
            appTheme: appTheme,
            valueStyle: appTheme.typographies.interFontFamily.body2M,
            hintStyle: appTheme.typographies.interFontFamily.body2R,
          ),
        ),
        const SizedBox(height: _size4),
        _sizedBox16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _buildError(
            appTheme: appTheme,
            errorLabelStyle: appTheme.typographies.interFontFamily.errorLabel4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _signInButton(
            context,
            state,
          ),
        ),
        _sizedBox16,
      ],
    );
  }

  Widget _buildTabletView({
    required BuildContext context,
    required LoginScreenState state,
    required IAppThemeData appTheme,
    required Size size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVerticalSpace(
          size: size,
          portion: .04,
        ),
        _buildScanButton(
          context: context,
          padding: _size40,
          radius: _size32,
          height: _scanIconTabSize,
          appTheme: appTheme,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.06,
        ),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
           const GTLogo(),
          ],
        ),
        _buildVerticalSpace(
          size: size,
          portion: .066,
        ),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            _loginText(appTheme: appTheme),
          ],
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.010,
        ),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            _loginContinueText(appTheme: appTheme),
          ],
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.010,
        ),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            _currentInstanceText(appTheme: appTheme),
          ],
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.043,
        ),
        _buildLoginForm(
          context: context,
          state: state,
          size: size,
          appTheme: appTheme,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _size32),
          child: _buildSignInOption(
            context: context,
            state: state,
            appTheme: appTheme,
          ),
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.03,
        ),
        _bulletPoints(
          appTheme: appTheme,
          size: size,
          style: appTheme.typographies.interFontFamily.label10,
        ),
        _buildVerticalSpace(
          size: size,
          portion: 0.04,
        ),
        _versionNumber(
          state: state,
          size: size,
        ),
      ],
    );
  }

  Widget _buildVerticalSpace({
    required Size size,
    required double portion,
  }) =>
      SizedBox(height: size.height * portion);

  Widget _buildHorizontalSpace({
    required Size size,
    required double portion,
  }) =>
      SizedBox(width: size.width * portion);

  Widget _loginText({required IAppThemeData appTheme}) {
    return GTText(
      Strings.signIn,
      style: appTheme.typographies.interFontFamily.headline2,
    );
  }

  Widget _loginContinueText({required IAppThemeData appTheme}) {
    return GTText(
      Strings.signInContinue + widget.viewModel.getAppName(),
      style: appTheme.typographies.interFontFamily.label9,
    );
  }

  Widget _currentInstanceText({required IAppThemeData appTheme}) {
    return GTText(
      '${Strings.currentInstance} ${widget.viewModel.getBaseUrl()}',
      style: appTheme.typographies.interFontFamily.label10,
      maxLines: 2,
    );
  }

  Widget _buildLoginForm({
    required BuildContext context,
    required LoginScreenState state,
    required Size size,
    required IAppThemeData appTheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            _labelText(
              Strings.emailAddress,
              style: appTheme.typographies.interFontFamily.label1,
            ),
          ],
        ),
        _sizedBox16,
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            Flexible(
              child: _emailTextField(
                appTheme: appTheme,
                valueStyle: appTheme.typographies.interFontFamily.body1
                    .copyWith(color: appTheme.colors.primaryText),
                hintStyle: appTheme.typographies.interFontFamily.body1,
              ),
            ),
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            )
          ],
        ),
        const SizedBox(height: _size24),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            _labelText(
              Strings.password,
              style: appTheme.typographies.interFontFamily.label1,
            ),
          ],
        ),
        _sizedBox16,
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            Flexible(
              child: _passwordTextField(
                appTheme: appTheme,
                valueStyle: appTheme.typographies.interFontFamily.body1
                    .copyWith(color: appTheme.colors.primaryText),
                hintStyle: appTheme.typographies.interFontFamily.body1,
              ),
            ),
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            )
          ],
        ),
        _sizedBox16,
        const SizedBox(height: _size24),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            Expanded(
              child: _buildError(
                appTheme: appTheme,
                errorLabelStyle:
                    appTheme.typographies.interFontFamily.errorLabel3,
              ),
            ),
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
          ],
        ),
        Row(
          children: [
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
            Flexible(
              child: _signInButton(
                context,
                state,
              ),
            ),
            _buildHorizontalSpace(
              size: size,
              portion: 0.26,
            ),
          ],
        ),
        const SizedBox(height: _size24),
      ],
    );
  }

  Widget _labelText(
    String text, {
    required TextStyle style,
  }) {
    return GTText(
      text,
      style: style,
    );
  }

  Widget _emailTextField({
    required IAppThemeData appTheme,
    required TextStyle valueStyle,
    required TextStyle hintStyle,
  }) {
    return GTTextInput(
      controller: _emailController,
      hint: Strings.emailAddress,
      valueStyle: valueStyle,
      hintStyle: hintStyle,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (value)  {},
      onChanged: (newValue) {
        widget.viewModel.onFormValuesChange(
          enableSignInButton: enableSignInButton,
          email: _emailController.text,
          password: _passwordController.text,
        );
      },
    );
  }

  Widget _passwordTextField({
    required IAppThemeData appTheme,
    required TextStyle valueStyle,
    required TextStyle hintStyle,
  }) {
    return GTTextInput(
      enableSuggestions: false,
      controller: _passwordController,
      inputType: InputType.password,
      hint: Strings.password,
      valueStyle: valueStyle,
      hintStyle: hintStyle,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (value)  {},
      onChanged: (newValue) {
        widget.viewModel.onFormValuesChange(
          enableSignInButton: enableSignInButton,
          email: _emailController.text,
          password: _passwordController.text,
        );
      },
    );
  }

  Widget _signInButton(BuildContext context, LoginScreenState state) {
    return ValueListenableBuilder<bool>(
      valueListenable: enableSignInButton,
      builder: (context, value, child) => GTButton.button(
        title: Strings.signIn,
        width: double.infinity,
        isEnable: value,
        onTap: () => widget.viewModel.login(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        ),
      ),
    );
  }

  Widget _buildScanButton({
    required BuildContext context,
    required double padding,
    required double radius,
    required IAppThemeData appTheme,
    double? height,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: padding),
          child: InkWell(
            onTap: () => {},
            child: Container(
              height: 36.0,
              width: 36.0,
              color: appTheme.colors.defaultBackground,
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.colors.defaultBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Resources.scanIcon,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInOption({
    required BuildContext context,
    required LoginScreenState state,
    required IAppThemeData appTheme,
  }) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _size16),
              child: GTText(Strings.signInWith),
            ),
            Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
        _sizedBox16,
        Row(
          children: [
            Expanded(
              child: _sizedBox16,
            ),
            Expanded(
              flex: 2,
              child: OutlinedButton(
                onPressed: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Logo(
                      Logos.microsoft,
                      size: _size24,
                    ),
                    const GTText(
                      Strings.microsoft,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: _sizedBox16,
            ),
          ],
        ),
      ],
    );
  }

  Widget _bulletPoints({
    required IAppThemeData appTheme,
    required Size size,
    required TextStyle style,
  }) {
    return Row(
      children: [
        _buildHorizontalSpace(
          size: size,
          portion: 0.26,
        ),
        _securityPoints(
          appTheme: appTheme,
          style: style,
        ),
      ],
    );
  }

  Widget _securityPoints({
    required IAppThemeData appTheme,
    required TextStyle style,
    String imageAsset = Resources.shieldIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPoint(
          point: Strings.point1,
          imageAsset: imageAsset,
          style: style,
          appTheme: appTheme,
        ),
        _sizedBox16,
        _buildPoint(
          point: Strings.point2,
          imageAsset: imageAsset,
          style: style,
          appTheme: appTheme,
        ),
        _sizedBox16,
        _buildPoint(
          point: Strings.point3,
          imageAsset: imageAsset,
          style: style,
          appTheme: appTheme,
        ),
      ],
    );
  }

  Widget _buildPoint({
    required String point,
    required String imageAsset,
    required TextStyle style,
    required IAppThemeData appTheme,
  }) {
    return Row(
      children: [
        SvgPicture.asset(imageAsset),
        const SizedBox(
          width: 10,
        ),
        GTText(
          point,
          style: style,
        )
      ],
    );
  }

  Widget _buildError({
    required IAppThemeData appTheme,
    required TextStyle errorLabelStyle,
  }) {
    return Visibility(
      visible: widget.viewModel.state.errorMessage.isNotEmpty,
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              decoration: appTheme.errorDecoration,
              padding: const EdgeInsets.symmetric(
                horizontal: _size16,
                vertical: _size4,
              ),
              child: GTText(
                widget.viewModel.state.errorMessage,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: errorLabelStyle,
              ),
            ),
            _sizedBox16,
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    enableSignInButton.dispose();
    super.dispose();
  }
}
