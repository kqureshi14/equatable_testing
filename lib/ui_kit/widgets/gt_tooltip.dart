import 'package:flutter/material.dart';

class GTTooltip extends StatelessWidget {
  const GTTooltip({
    required String message,
    required Widget child,
    Key? key,
  })  : _child = child,
        _message = message,
        super(key: key);

  final String _message;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _message,
      triggerMode: TooltipTriggerMode.tap,
      child: _child,
    );
  }
}
