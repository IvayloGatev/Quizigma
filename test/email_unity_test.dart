import 'package:flutter_test/flutter_test.dart';
import 'package:quizigma/views/home/login/email_field_validator.dart';

void main() {
  test("empty email returns error string", () {
    var result = EmailFieldValidator.validate("");
    expect(result, 'E-mail is required');
  });

  test("invalid email returns error string", () {
    var result = EmailFieldValidator.validate("example");
    expect(result, 'Please enter a valid email Address');
  });

  test("invalid email returns error string", () {
    var result = EmailFieldValidator.validate("example@example");
    expect(result, 'Please enter a valid email Address');
  });

  test("valid email is put", () {
    var result = EmailFieldValidator.validate("example@example.com");
    expect(result, null);
  });
}
