class PasswordFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
