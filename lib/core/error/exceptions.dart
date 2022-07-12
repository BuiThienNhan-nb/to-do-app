class BaseException implements Exception {
  final String message;

  BaseException(this.message);
}

class ServerException extends BaseException {
  ServerException(String message) : super(message);
}

class UserException extends BaseException {
  UserException(String message) : super(message);
}
