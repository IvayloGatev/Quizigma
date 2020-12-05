import 'package:quizigma/views/home/login/password_field_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("empty password returns error string", () {
    var result = PasswordFieldValidator.validate("");
    expect(result, 'Password required');
  });

  test("correct password is put", () {
    var result = PasswordFieldValidator.validate("example");
    expect(result, null);
  });
}
