part of 'default_theme.dart';

class _Typographies extends ITypographies {
  const _Typographies();

  static const _InterTypography _interTypography = _InterTypography();

  @override
  ITypography byFontFamily([
    FontFamily? fontFamily,
  ]) {
    switch (fontFamily) {
      case FontFamily.inter:
        return _interTypography;
      default:
        return _interTypography;
    }
  }

  @override
  ITypography get interFontFamily => _interTypography;
}

class _InterTypography extends ITypography {
  const _InterTypography();

  static const _size40 = 40.0;
  static const _size32 = 32.0;
  static const _size26 = 26.0;
  static const _size20 = 20.0;
  static const _size18 = 18.0;
  static const _size16 = 16.0;
  static const _size15 = 15.0;
  static const _size14 = 14.0;
  static const _size13 = 13.0;
  static const _size12 = 12.0;
  static const _size11 = 11.0;

  static const _defaultTextColor = _IColors.black;

  TextStyle get _baseTextStyle => GoogleFonts.inter(
        color: _defaultTextColor,
        fontWeight: FontWeight.w400,
        fontSize: _size16,
      );

  @override
  TextStyle get headline1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: _size40,
        color: _IColors.black,
      );

  @override
  TextStyle get headline2 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: _size32,
        color: _IColors.grey09,
      );

  @override
  TextStyle get headline3 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: _size26,
        color: _IColors.grey10,
      );

  @override
  TextStyle get headline4 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: _size18,
        color: _IColors.grey09,
      );

  @override
  TextStyle get headline5 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _size16,
        color: _IColors.grey10,
      );

  @override
  TextStyle get headline6 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size20,
        color: _IColors.black01,
      );

  @override
  TextStyle get label1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: _size16,
        color: _IColors.grey08,
      );

  @override
  TextStyle get label2 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size14,
        color: _IColors.grey08,
      );

  @override
  TextStyle get label3 => _baseTextStyle.copyWith(
        fontSize: _size13,
        fontWeight: FontWeight.w500,
        color: _IColors.red0,
      );

  @override
  TextStyle get label4 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size12,
        color: _IColors.grey10,
      );

  @override
  TextStyle get label5 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: _size11,
      );

  @override
  TextStyle get label6 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size14,
        color: _IColors.grey10,
      );

  @override
  TextStyle get label7 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: _size14,
        color: _IColors.grey10,
      );

  @override
  TextStyle get label8 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size14,
        color: _IColors.black,
      );

  @override
  TextStyle get label9 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size14,
        color: _IColors.grey20,
      );

  @override
  TextStyle get label10 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: _size12,
        color: _IColors.grey21,
      );

  @override
  TextStyle get label11 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _size11,
        color: _IColors.grey10,
        letterSpacing: 0.5,
      );

  @override
  TextStyle get label14 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: _size12,
        color: _IColors.grey10,
        height: 1.3,
      );

  @override
  TextStyle get label15 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size14,
        color: _IColors.grey10,
        height: 1.42,
      );

  @override
  TextStyle get errorLabel3 => caption3.copyWith(
        color: _IColors.red0,
      );

  @override
  TextStyle get errorLabel4 => label4.copyWith(
        color: _IColors.red0,
      );

  @override
  TextStyle get body1 => _baseTextStyle.copyWith(
        fontSize: _size16,
        fontWeight: FontWeight.w500,
        color: _IColors.grey07,
      );

  @override
  TextStyle get body2 => _baseTextStyle.copyWith(
        fontSize: _size14,
        fontWeight: FontWeight.w700,
        color: _IColors.grey07,
      );

  @override
  TextStyle get body3 => _baseTextStyle.copyWith(
        fontSize: _size18,
        fontWeight: FontWeight.w400,
        color: _IColors.grey07,
      );

  @override
  TextStyle get body4 => _baseTextStyle.copyWith(
        fontSize: _size18,
        fontWeight: FontWeight.w500,
        color: _IColors.black01,
      );

  @override
  TextStyle get body2R => _baseTextStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: _size14,
        color: _IColors.grey07,
      );

  @override
  TextStyle get body2M => body2R.copyWith(
        fontWeight: FontWeight.w500,
        color: _IColors.grey20,
      );

  @override
  TextStyle get button1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: _IColors.grey09,
        fontSize: _size18,
      );

  @override
  TextStyle get button3 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size14,
        color: _IColors.grey09,
      );

  @override
  TextStyle get caption3 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size13,
        color: _IColors.blue07,
      );

  @override
  TextStyle get caption4 => _baseTextStyle.copyWith(
        fontSize: _size12,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get alert2 => body1.copyWith(
        color: _IColors.grey11,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get label16 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _size15,
        color: _IColors.grey10,
        height: 1.71,
      );
}
