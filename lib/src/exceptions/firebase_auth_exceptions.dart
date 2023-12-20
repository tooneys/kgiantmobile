class KFirebaseAuthException implements Exception {
  final String code;

  KFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return '이미 사용중인 email이 존재합니다. 다른 email을 사용하시기 바랍니다.';

      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';

      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password';

      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance';

      case 'user-not-found':
        return 'Invalid login details. User not found.';

      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';

      case 'invalid-verification-code':
        return 'Invalid verification ID. Please request a new verification code.';

      case 'quota-exceeded':
        return 'Quota exceeded. Please try again late.';

      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.';

      case 'provider-already-linked':
        return 'The account is already linked with another provider.';

      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
