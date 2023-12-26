class KFormatException implements Exception {

  final String message;

  const KFormatException([this.message = '에러가 발생했습니다. 입력한 내용을 확인바랍니다.']);

  factory KFormatException.fromMessage(String message) {
    return KFormatException(message);
  }

  String get formattedMessage => message;

  factory KFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const KFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const KFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const KFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const KFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-numeric-format':
        return const KFormatException('The input should be a valid numeric format.');
      default:
        return const KFormatException();
    }
  }
}