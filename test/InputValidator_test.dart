import 'package:harvest/controll/inputValidator.dart';
import 'package:test/test.dart';

void main() {
  test('test field empty returns error', () {
    String result = inputValidator.validateEmail("");

    expect(result, "An E-mail is required to Login.");
  });

  test('test user input email correct returns null', () {
    String result = inputValidator.validatePassword("");

    expect(result, "Please re-enter password");
  });

  test('test user name correct returns null', () {
    String result = inputValidator.validateName("");

    expect(result, "Please Enter first name");
  });

  test('test user Last name correct returns null', () {
    String result = inputValidator.validateLastName("");

    expect(result, "Please Enter last name");
  });

  test('test user Weight on add to log is correct', () {
    String result = inputValidator.validateWeight("");

    expect(result, "Enter valid weight in grams");
  });

  test('test user phone is correct', () {
    String result = inputValidator.validatePhone("");

    expect(result, "Phone number is required to register.");
  });
}
