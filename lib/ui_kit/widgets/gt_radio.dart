import 'package:flutter/material.dart';

import 'package:equatable_testing/screens/custom_form/widgets/gt_field_option.dart';
import 'package:equatable_testing/services/services.dart';

import '../../services/renderer/field_renderer_helpers.dart';

class GTRadio<T> extends StatefulWidget {
  const GTRadio({
    required this.items,
    required this.onChanged,
    this.value,
    this.isDisabled,
    this.orientation = FieldOrientation.vertical,
    this.controlAffinity = ControlAffinity.leading,
    Key? key,
  }) : super(key: key);

  final List<GTFieldOption<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final FieldOrientation orientation;
  final ControlAffinity controlAffinity;
  final List<T>? isDisabled;

  @override
  _GTRadioState<T> createState() => _GTRadioState<T>();
}

class _GTRadioState<T> extends State<GTRadio<T?>> {
  @override
  Widget build(BuildContext context) {
    final radioItems = <Widget>[];
    late final Widget extoRadio;

    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items[i].optionData.isHidden == false) {
        radioItems.add(item(i));
      }
    }

    if (widget.orientation == FieldOrientation.vertical) {
      extoRadio = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: radioItems,
        ),
      );
    } else {
      extoRadio = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: radioItems.map((item) {
            return Column(children: <Widget>[item]);
          }).toList(),
        ),
      );
    }
    return extoRadio;
  }

  Widget item(int index) {
    final option = widget.items[index];
    final optionValue = option.optionData.value;
    final control = Radio<T?>(
      groupValue: widget.value,
      value: option.optionData.value,
      toggleable: true,
      onChanged: option.optionData.isDisable
          ? null
          : (T? selected) {
              widget.onChanged(selected);
            },
    );

    final item = GestureDetector(
      onTap: option.optionData.isDisable
          ? null
          : () {
              widget.onChanged(optionValue);
            },
      child: widget.items[index],
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.controlAffinity == ControlAffinity.leading) control,
        Flexible(
          child: item,
        ),
        if (widget.controlAffinity == ControlAffinity.trailing) control,
      ],
    );
  }
}
