import 'package:equatable_testing/constants/strings.dart';

extension StringHelper on String {
  String getShortName() {
    final trimmed = trim();
    if (trimmed.isNotEmpty) {
      final txtList = trimmed.split(' ');
      final hasMultiplePart = txtList.length > 1;
      return '${txtList[0][0].toUpperCase()}${hasMultiplePart ? txtList[1][0].toUpperCase() : ''}';
    } else {
      return '';
    }
  }

  String getFirstLetter() {
    return this[0].toUpperCase();
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String lastNDigits({int n = 6}) {
    return substring(length - n);
  }

  String getValidDate(String _date) {
    return _date.replaceAll('T', ' ').split(' ').first.trim();
  }

  String getValidDateTime(String _dateTime) {
    var temp = _dateTime;
    temp = _dateTime.replaceAll('T', ' ').split('.').first.trim();
    if (temp.length > 17) {
      return temp.substring(0, temp.length - 3);
    }
    return temp.substring(0, temp.length);
  }

  bool isLoginValid(String emailId) {
    if (emailId.isNotEmpty &&
        emailId.length >= Strings.minimumLoginIdSize &&
        emailId.length <= Strings.maximumLoginIdSize &&
        Strings.loginIDAndPasswordExp.hasMatch(emailId)) {
      return true;
    } else {
      return false;
    }
  }

  String? usernameValidation() {
    if (length < Strings.minimumLoginIdSize) {
      return Strings.usernameValidationError1;
    } else if (length >= Strings.minimumLoginIdSize &&
        length <= Strings.maximumLoginIdSize &&
        !Strings.loginIDAndPasswordExp.hasMatch(this)) {
      return Strings.usernameValidationError3;
    } else if (length > Strings.maximumLoginIdSize) {
      return Strings.usernameValidationError2;
    }
    return null;
  }

  String? passwordValidation() {
    if (length < Strings.minimumPasswordSize) {
      return Strings.passwordValidationError1;
    } else if (length >= Strings.minimumPasswordSize &&
        length <= Strings.maximumPasswordSize &&
        !Strings.loginIDAndPasswordExp.hasMatch(this)) {
      return Strings.usernameValidationError3;
    } else if (length > Strings.maximumPasswordSize) {
      return Strings.passwordValidationError2;
    }
    return null;
  }

  bool isPasswordValid(String password) {
    if (password.isNotEmpty &&
        password.length >= Strings.minimumPasswordSize &&
        password.length <= Strings.maximumPasswordSize &&
        Strings.loginIDAndPasswordExp.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  ///return true, if the string is date iso string, else false
  bool isIsoDateString() {
    try {
      DateTime.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  DateTime parseCustomDate(String dateString) {
    var monthAbbreviations = <String, String>{
      'Jan': '01',
      'Feb': '02',
      'Mar': '03',
      'Apr': '04',
      'May': '05',
      'Jun': '06',
      'Jul': '07',
      'Aug': '08',
      'Sep': '09',
      'Oct': '10',
      'Nov': '11',
      'Dec': '12',
    };

    var regExp = RegExp(r'(\d{2})/(\w{3})/(\d{4})');
    var match = regExp.firstMatch(dateString);

    if (match != null) {
      var day = match.group(1);
      var monthAbbreviation = match.group(2);
      var year = match.group(3);

      var month = monthAbbreviations[monthAbbreviation];

      if (day != null && month != null && year != null) {
        return DateTime(int.parse(year), int.parse(month), int.parse(day));
      }
    }

    throw FormatException('Invalid date format: $dateString');
  }
}
