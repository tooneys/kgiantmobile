class KPlatformException implements Exception {
  final String code;

  KPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credential. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
