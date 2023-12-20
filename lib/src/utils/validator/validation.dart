class KValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName을 입력해 주세요.';
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email을 입력해 주세요.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return '유효한 Email이 아닙니다.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해 주세요.';
    }

    if (value.length < 6) {
      return '비밀번호는 6자리 이상 입력해 주세요.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '대문자가 하나이상 포함되어야 합니다.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return '숫자가 하나이상 포함되어야 합니다.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '특수문자가 하나이상 포함되어야 합니다.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return '핸드폰ㅇ번호를 입력해 주세요.';
    }

    final phoneRegExp = RegExp(r'^\d{11}$');

    if (!phoneRegExp.hasMatch(value)) {
      return '핸드폰번호를 11자리를 입력하세요.';
    }

    return null;
  }
}
