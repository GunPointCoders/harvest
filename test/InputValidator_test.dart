import 'package:harvest/controll/inputValidator.dart';
import 'package:test/test.dart';

void main() {
  test('test field empty returns error', () {
    String result = inputValidator.validateEmail("");

    expect(result, "An E-mail is required to Login.");
  });
}
