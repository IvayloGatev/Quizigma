class PasswordFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Password required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value.length > 25) {
      return 'Password must be less than 25 characters';
    }
    return null;
  }
}
