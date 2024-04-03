import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  const LoginResponse({
    required this.idToken,
    required this.user,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      idToken: json['id_token'],
      user: User.fromJson(json['user']),
      message: json['message'] ?? '',
    );
  }

  factory LoginResponse.fromErrorJson(Map<String, dynamic> json) {
    return LoginResponse(
      idToken: '',
      user: json['user'] ?? '',
      message: json['message'],
    );
  }

  factory LoginResponse.empty() {
    return LoginResponse(
      idToken: '',
      user: User.empty(),
      message: '',
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_token'] = idToken;
    data['user'] = user.toJson();
    data['message'] = message;
    return data;
  }

  final String idToken;
  final User user;
  final String message;

  @override
  List<Object?> get props => [
        idToken,
        user,
        message,
      ];
}

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.fullname,
    required this.tenantId,
    required this.role,
    required this.email,
    this.company,
    this.verifyEmailOtp = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        fullname: json['fullName'] ?? json['fullname'],
        tenantId: json['tenantID'] ?? json['tenantId'] ?? '',
        role: json['role'],
        company: json['company'] ?? '',
        email: json['email'],
        verifyEmailOtp: json['verifyEmailOTP'] ?? false,
      );

  factory User.empty() => const User(
        id: '',
        username: '',
        fullname: '',
        tenantId: '',
        role: '',
        company: '',
        email: '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'fullname': fullname,
        'tenantID': tenantId,
        'role': role,
        'company': company,
        'email': email,
        'verifyEmailOTP': verifyEmailOtp,
      };

  final String id;
  final String username;
  final String fullname;
  final String tenantId;
  final String role;
  final String? company;
  final bool verifyEmailOtp;
  final String email;

  @override
  List<Object?> get props => [
        id,
        username,
        fullname,
        tenantId,
        role,
        company,
        email,
        verifyEmailOtp,
      ];
}
