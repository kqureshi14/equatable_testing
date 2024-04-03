import 'dart:convert';

import 'package:equatable/equatable.dart';

ApiFailure apiFailureFromJson(String str) =>
    ApiFailure.fromJson(json.decode(str));

String apiFailureToJson(ApiFailure data) => json.encode(data.toJson());

class ApiFailure extends Equatable {
  const ApiFailure({
    required this.code,
    required this.timestamp,
    required this.path,
    required this.error,
  });

  factory ApiFailure.fromJson(Map<String, dynamic> json) => ApiFailure(
        code: json['code'],
        timestamp: DateTime.parse(json['timestamp']),
        path: json['path'],
        error: Error.fromJson(json['error']),
      );

  final int code;
  final DateTime timestamp;
  final String path;
  final Error error;

  Map<String, dynamic> toJson() => {
        'code': code,
        'timestamp': timestamp.toIso8601String(),
        'path': path,
        'error': error.toJson(),
      };

  @override
  List<Object?> get props => [
        code,
        timestamp,
        path,
        error,
      ];
}

class Error extends Equatable {
  const Error({
    required this.summary,
    required this.detail,
    required this.mainForms,
    required this.subForms,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        summary: json['summary'],
        detail: json['detail'] == null
            ? []
            : List<String>.from(json['detail'].map((x) => x)),
        mainForms: json['mainForms'] == null
            ? []
            : List<String>.from(json['mainForms'].map((x) => '$x')),
        subForms: json['subForms'] == null
            ? []
            : List<SubForms>.from(
                json['subForms'].map(
                  (x) => SubForms.fromJson(x),
                ),
              ),
      );

  final String summary;
  final List<String> detail;
  final List<String> mainForms;
  final List<SubForms> subForms;

  Map<String, dynamic> toJson() => {
        'summary': summary,
        'detail': List<dynamic>.from(detail.map((x) => x)),
        'mainForms': List<dynamic>.from(mainForms.map((x) => x)),
        'subForms': List<dynamic>.from(subForms.map((e) => e.toJson()))
      };

  @override
  List<Object?> get props => [
        summary,
        detail,
        mainForms,
        subForms,
      ];
}

class SubForms extends Equatable {
  const SubForms({
    required this.name,
    required this.title,
    required this.errors,
  });

  factory SubForms.fromJson(Map<String, dynamic> json) {
    return SubForms(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      errors: json['errors'] == null
          ? []
          : List<SubFormsError>.from(
              json['errors'].map((x) {
                return SubFormsError.fromJson(x);
              }),
            ),
    );
  }

  final String name;
  final String title;
  final List<SubFormsError> errors;

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'errors': List<dynamic>.from(errors.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        name,
        title,
        errors,
      ];
}

class SubFormsError extends Equatable {
  const SubFormsError({
    required this.row,
    required this.error,
  });

  factory SubFormsError.fromJson(Map<String, dynamic> json) {
    return SubFormsError(
      row: json['row'] == null ? -1 : int.parse(json['row'].toString()),
      error: json['error'] == null
          ? []
          : List<String>.from(
              json['error'].map((x) => x),
            ),
    );
  }

  final int row;
  final List<String> error;

  Map<String, dynamic> toJson() => {
        'row': row,
        'error': List<dynamic>.from(error.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        row,
        error,
      ];
}
