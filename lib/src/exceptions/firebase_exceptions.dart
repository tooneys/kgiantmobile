class KFirebaseException implements Exception {
  final String code;

  KFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted';
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'credential-already-in-use':
        return 'This credential is already with a different user account.';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}