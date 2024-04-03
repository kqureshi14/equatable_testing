import 'package:equatable_testing/constants/constants.dart';

enum ExceptionType {
  network,
  storage,
  unknown,
}

class GTException implements Exception {
  GTException(
    this.message,
    this._prefix,
  );

  final String _prefix;
  final String message;

  @override
  String toString() {
    return '$_prefix$message';
  }
}

//Network Exceptions
class FetchDataException extends GTException {
  FetchDataException(String message)
      : super(
          message,
          Api.communicationError,
        );
}

class BadRequestException extends GTException {
  BadRequestException(String message)
      : super(
          message,
          Api.invalidRequest,
        );
}

class UnauthorisedException extends GTException {
  UnauthorisedException(String message)
      : super(
          message,
          Api.unauthorizedRequest,
        );
}

class InvalidInputException extends GTException {
  InvalidInputException(String message)
      : super(
          message,
          Api.requiredField,
        );
}

//Storage Exceptions
class StorageException extends GTException {
  StorageException(String message)
      : super(
          message,
          Strings.storageOperationsFailure,
        );
}
