class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class FullOTPRequestException extends CustomException {
  FullOTPRequestException([message]) : super(message, "Gửi xác nhận otp quá nhiều lần.Vui lòng liên hệ Admin");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class PermissionDeniedException extends CustomException {
  PermissionDeniedException([message])
      : super(message, "Permission Is Denied: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class InvalidStateException extends CustomException {
  InvalidStateException() : super("State is not defined", "Invalid State: ");
}

class GraphqlException extends CustomException {
  GraphqlException([message]) : super(message, "");
}