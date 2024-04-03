import 'package:flutter/material.dart';

import 'package:equatable_testing/ui_kit/widgets/gt_text.dart';

class GTFieldOption<T> extends StatelessWidget {
  const GTFieldOption({
    required this.optionData,
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final FieldOptionModel optionData;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: optionData.isDisable,
      child: child ?? GTText(optionData.label),
    );
  }
}

class FieldOptionModel<T> {
  FieldOptionModel({
    required this.id,
    required this.label,
    required this.value,
    this.isDisable = false,
    this.isHidden = false,
  });

  final String id;
  final String label;
  final T value;
  final bool isDisable;
  final bool isHidden;
}
