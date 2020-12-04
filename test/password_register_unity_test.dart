import 'package:quizigma/views/home/register/password_field_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("empty password returns error string", () {
    var result = PasswordFieldValidator.validate("");
    expect(result, 'Password required');
  });

  test("password less than 6 characters returns error string", () {
    var result = PasswordFieldValidator.validate("exam");
    expect(result, 'Password must be at least 6 characters');
  });

  test("password bigger than 25 characters returns error string", () {
    var result =
        PasswordFieldValidator.validate("exampleexampleexampleexample");
    expect(result, 'Password must be less than 25 characters');
  });

  test("correct password is put", () {
    var result = PasswordFieldValidator.validate("example");
    expect(result, null);
  });
}
