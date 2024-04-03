import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/constants/resources.dart';

enum InputType {
  text,
  password,
  email,
  digit,
}

class GTTextInput extends StatefulWidget {
  GTTextInput({
    required TextController controller,
    String? Function(String?)? validator,
    ValueChanged<bool>? onValidateChanged,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onEditingDone,
    bool isMultiline = false,
    bool enableSuggestions = true,
    bool isEnable = true,
    bool isReadOnly = false,
    bool validateOnStart = false,
    bool focusField = false,
    bool displayBorder = true,
    InputType inputType = InputType.text,
    String? hint,
    String? labelText,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    TextStyle? hintStyle,
    IconData? prefixIcon,
    String? suffixIcon,
    void Function()? onSuffixIconClick,
    void Function()? onPrefixIconClick,
    Color? backgroundColor,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    EdgeInsetsGeometry? contentPadding,
    double? height,
    double? width,
    AutovalidateMode? autoValidateMode,
    Key? key,
  })  : _onChanged = onChanged,
        _onEditingDone = onEditingDone,
        _controller = controller,
        _hint = hint,
        _labelText = labelText,
        _labelStyle = labelStyle,
        _valueStyle = valueStyle,
        _hintStyle = hintStyle,
        _inputType = inputType,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _isMultiline = isMultiline,
        _enableSuggestions = enableSuggestions,
        _isEnable = isEnable,
        _isReadOnly = isReadOnly,
        _backgroundColor = backgroundColor,
        _validator = validator,
        _onValidateChanged = onValidateChanged,
        _onSuffixIconClick = onSuffixIconClick,
        _onPrefixIconClick = onPrefixIconClick,
        _enabledBorder = enabledBorder,
        _errorBorder = errorBorder,
        _focusedBorder = focusedBorder,
        _contentPadding = contentPadding,
        _height = height,
        _width = width,
        _focusField = focusField,
        _displayBorder = displayBorder,
        _isVerifyOnStart = validateOnStart,
        _autoValidateMode = autoValidateMode,
        super(key: key) {
    _selectInputType();
  }

  final String? _hint;
  final String? _labelText;
  final TextStyle? _labelStyle;
  final TextStyle? _valueStyle;
  final TextStyle? _hintStyle;
  final InputType _inputType;
  final IconData? _prefixIcon;
  final String? _suffixIcon;
  final void Function()? _onSuffixIconClick;
  final void Function()? _onPrefixIconClick;
  final ValueChanged<String>? _onChanged;
  final TextEditingController _controller;
  final bool _isMultiline;
  final bool _enableSuggestions;
  final bool _isEnable;
  final bool _isReadOnly;
  final bool _isVerifyOnStart;
  final Color? _backgroundColor;
  final String? Function(String?)? _validator;
  final ValueChanged<bool>? _onValidateChanged;
  final InputBorder? _enabledBorder;
  final InputBorder? _focusedBorder;
  final InputBorder? _errorBorder;
  final EdgeInsetsGeometry? _contentPadding;
  final double? _height;
  final double? _width;
  final bool _focusField;
  final bool _displayBorder;
  late final TextInputType _keyboardType;
  late final bool _passwordMode;
  final ValueChanged<String>? _onEditingDone;
  final AutovalidateMode? _autoValidateMode;

  void _selectInputType() {
    switch (_inputType) {
      case InputType.email:
        _keyboardType = TextInputType.emailAddress;
        _passwordMode = false;
        break;
      case InputType.password:
        _keyboardType = TextInputType.visiblePassword;
        _passwordMode = true;
        break;
      case InputType.text:
        _keyboardType = TextInputType.text;
        _passwordMode = false;
        break;
      case InputType.digit:
        _keyboardType = TextInputType.number;
        _passwordMode = false;
        break;
      default:
        _keyboardType = TextInputType.text;
        _passwordMode = false;
        break;
    }
  }

  @override
  State<GTTextInput> createState() => _GTTextInputState();
}

class _GTTextInputState extends State<GTTextInput> {
  late bool _isPasswordHidden;
  final focusNode = FocusNode();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _isPasswordHidden = widget._passwordMode;

    if (widget._isVerifyOnStart && widget._controller.text.isNotEmpty) {
      _validate();
    } else if (widget._controller.text.isNotEmpty) {
      _validate();
    }

    /// for every change in focus, the widget needs to be rebuilt
    /// to reflect color changes for character limitation and label
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _validate();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return SizedBox(
      height: widget._height,
      width: widget._width,
      child: TextFormField(
        autocorrect: widget._enableSuggestions,
        enableSuggestions: widget._enableSuggestions,
        enabled: widget._isEnable,
        readOnly: widget._isReadOnly,
        focusNode: focusNode,
        keyboardType: widget._keyboardType,
        obscureText: _isPasswordHidden,
        controller: widget._controller,
        maxLines: widget._isMultiline ? 3 : 1,
        textInputAction: TextInputAction.done,
        cursorColor: appTheme.colors.defaultBorder,
        inputFormatters: [
          if (widget._inputType == InputType.digit)
            FilteringTextInputFormatter.digitsOnly
        ],
        style: widget._valueStyle,
        decoration: InputDecoration(
          fillColor: widget._backgroundColor ?? appTheme.colors.transparent,
          filled: true,
          errorText: errorMessage,
          errorMaxLines: 2,
          hintText: widget._hint,
          hintStyle: widget._hintStyle,
          labelText: widget._labelText,
          labelStyle: widget._valueStyle,
          floatingLabelStyle: widget._labelStyle,
          enabledBorder: widget._displayBorder
              ? widget._enabledBorder ?? appTheme.enabledBorder
              : InputBorder.none,
          border: widget._displayBorder
              ? widget._enabledBorder ?? appTheme.inputBorder
              : InputBorder.none,
          focusedBorder: widget._displayBorder
              ? widget._focusedBorder ?? appTheme.focusedBorder
              : InputBorder.none,
          disabledBorder: widget._displayBorder
              ? appTheme.disabledBorder
              : InputBorder.none,
          errorBorder: widget._errorBorder,
          prefixIcon: widget._prefixIcon != null ? _buildPrefixIcon() : null,
          suffixIcon: _buildSuffixIcon(appTheme),
          contentPadding: widget._contentPadding,
        ),
        validator: widget._validator,
        autovalidateMode: widget._autoValidateMode,
        onChanged: _onChange,
        onEditingComplete: _onEditingComplete,
      ),
    );
  }

  Widget? _buildSuffixIcon(IAppThemeData appTheme) {
    switch (widget._inputType) {
      case InputType.password:
        return InkWell(
          onTap: _toggle,
          child: Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: _isPasswordHidden
                ? SvgPicture.asset(
                    Resources.eyeClosedIcon,
                  )
                : SvgPicture.asset(
                    Resources.eyeOpenIcon,
                  ),
          ),
        );
      default:
        return widget._suffixIcon == null
            ? null
            : InkWell(
                onTap: () {
                  if (widget._focusField) {
                    FocusScope.of(context).requestFocus(focusNode);
                  }
                  FocusScope.of(context).requestFocus(focusNode);
                  widget._onSuffixIconClick?.call();
                },
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    widget._suffixIcon!,
                  ),
                ),
              );
    }
  }

  Widget _buildPrefixIcon() {
    return widget._onPrefixIconClick != null
        ? InkWell(
            onTap: () {
              if (widget._focusField) {
                FocusScope.of(context).requestFocus(focusNode);
              }
              widget._onPrefixIconClick!.call();
            },
            child: Icon(
              widget._prefixIcon,
            ),
          )
        : Icon(widget._prefixIcon);
  }

  void _toggle() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void _onChange(newValue) {
    _validate();
    widget._onValidateChanged?.call(errorMessage == null);
    setState(() {});
    if (widget._onChanged != null) {
      widget._onChanged!(newValue);
    }
  }

  void _onEditingComplete() {
    _validate();
    focusNode.unfocus();
    widget._onValidateChanged?.call(errorMessage == null);
    widget._onEditingDone?.call(widget._controller.text);
    setState(() {});
  }

  void _validate() {
    errorMessage = widget._validator?.call(widget._controller.text);
  }
}

class TextController extends TextEditingController {
  TextController({String? text}) {
    this.text = text;
  }

  @override
  set text(String? newText) {
    if (newText != null) {
      value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
        composing: TextRange.empty,
      );
    }
  }
}
