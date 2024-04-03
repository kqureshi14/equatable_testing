import 'package:equatable_testing/constants/constants.dart';

class ParseHelper {
  static dynamic parseToType(dynamic value, String type) {
    if (value == null) {
      return '';
    } else {
      switch (type) {
        case Strings.fieldNumber:
          return int.tryParse(value) ?? value.toString();
        default:
          return value.toString();
      }
    }
  }

  static List stringToList(dynamic value) {
    try {
      if (value is String && value.isNotEmpty) {
        final newValue = (value.contains('[') || value.contains(']'))
            ? value.replaceAll('[', '').replaceAll(']', '').split(',')
            : value.split(',');
        return newValue;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
