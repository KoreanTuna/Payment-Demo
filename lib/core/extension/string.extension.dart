extension StringExtension on String {
  /// 해당 String이 유효한 이메일 주소인지 확인합니다.
  /// 이메일 주소는 '@' 기호와 '.' 기호를 포함해야 합니다.
  /// 예시:
  /// - valid: "example@example.com"
  /// - invalid: "example.com", "example@.com", "example@com"
  ///
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// 해당 String이 유효한 전화번호인지 확인합니다.
  /// 전화번호는 숫자만 포함되어야 합니다.
  /// 예시: 01012345678
  /// 전화번호는 11자리로 제한
  bool isValidKoreanPhoneNumber() {
    final phoneRegex = RegExp(r'^\d{11}$');
    if (length != 11) {
      return false;
    }
    return phoneRegex.hasMatch(this);
  }

  /// 해당 String이 유효한 국제 전화번호인지 확인합니다.
  /// 국제 전화번호는 + 기호로 시작하고, 숫자만 포함되어야 합니다.
  /// 예시: +821012345678
  /// 국제 전화번호는 10자리에서 15자리로 제한
  /// + 기호를 포함한 경우는 11자리에서 16자리로 제한
  bool isValidInternationalPhoneNumber() {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (startsWith('+')) {
      return length >= 11 && length <= 16 && phoneRegex.hasMatch(this);
    }
    return length >= 10 && length <= 15 && phoneRegex.hasMatch(this);
  }
}
