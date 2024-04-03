import 'dart:convert';

String passwordChangeToJson(PasswordChange data) => json.encode(data.toJson());

class PasswordChange {
  PasswordChange({
    required this.newPassword,
    required this.oldPassword,
  });

  final String newPassword;
  final String oldPassword;

  Map<String, dynamic> toJson() => {
        'newPassword': newPassword,
        'oldPassword': oldPassword,
      };
}
