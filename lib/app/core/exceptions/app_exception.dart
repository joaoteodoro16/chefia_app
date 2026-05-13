class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(super.message);
}
