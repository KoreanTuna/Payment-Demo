sealed class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() {
    return 'CustomException: $message';
  }

  String getErrorMessage() {
    return message;
  }
}

class CustomFormatException extends CustomException {
  CustomFormatException(super.message);
}
