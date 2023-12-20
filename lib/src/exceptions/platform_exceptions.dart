class KPlatformException implements Exception {
  final String code;

  KPlatformException(this.code);

  String get message {
    switch (code) {
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}