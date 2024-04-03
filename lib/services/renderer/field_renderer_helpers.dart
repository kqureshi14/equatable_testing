import 'package:flutter/material.dart';

import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/helpers/enum_helper.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';

enum FieldType {
  text,
  number,
  date,
}

enum ParagraphSize {
  auto,
  small,
  medium,
}

enum FieldHeightType {
  auto,
  fixed,
  basedOnSize,
}

enum FieldDirectionType {
  horizontal,
  vertical,
}

enum FieldOrientation {
  horizontal,
  vertical,
}

enum ControlAffinity {
  leading,
  trailing,
}

abstract class FieldRendererHelpers {
  static FieldType specifyFieldType(String type) {
    if (type == EnumHelpers.humanize(FieldType.text)) {
      return FieldType.text;
    } else if (type == EnumHelpers.humanize(FieldType.date)) {
      return FieldType.date;
    } else if (type == EnumHelpers.humanize(FieldType.number)) {
      return FieldType.number;
    } else {
      return FieldType.text;
    }
  }

  static FieldHeightType specifyHeightType(String heightType) {
    if (heightType == EnumHelpers.humanize(FieldHeightType.auto)) {
      return FieldHeightType.auto;
    } else if (heightType == EnumHelpers.humanize(FieldHeightType.fixed)) {
      return FieldHeightType.fixed;
    } else {
      return FieldHeightType.basedOnSize;
    }
  }

  static ParagraphSize specifyParagraphSize(String paragraphSize) {
    if (paragraphSize == EnumHelpers.humanize(ParagraphSize.auto)) {
      return ParagraphSize.auto;
    } else if (paragraphSize == EnumHelpers.humanize(ParagraphSize.small)) {
      return ParagraphSize.small;
    } else {
      return ParagraphSize.medium;
    }
  }

  static Axis specifyDirection(String direction) {
    if (direction == EnumHelpers.humanize(FieldDirectionType.vertical)) {
      return Axis.vertical;
    } else {
      return Axis.horizontal;
    }
  }

  static List<ContextMenuAction> specifyActions(dynamic item) {
    final actions = <ContextMenuAction>[];
    if (item.attachments != null && item.attachments!.show) {
      actions.add(
        ContextMenuAction(
          icon: Icons.attach_file,
          onTap: () {},
          title: Strings.checkListAttachmentActionLabel,
        ),
      );
    }
    return actions;
  }

  static FieldOrientation specifyOrientation(String direction) {
    if (direction == EnumHelpers.humanize(FieldDirectionType.vertical)) {
      return FieldOrientation.vertical;
    } else {
      return FieldOrientation.horizontal;
    }
  }

  static String? validatorFunction(String? str) {
    if (str!.isEmpty) {
      return Api.requiredField;
    }
    return null;
  }

  static String? listValidator(List<String>? str) {
    if (str != null && str.isEmpty) {
      return Api.requiredField;
    }
    return null;
  }
}
