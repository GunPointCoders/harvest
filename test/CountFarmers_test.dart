import 'package:harvest/join_log.dart';
import 'package:test/test.dart';
void main() {
  test('Counter value should be incremented', () {
    final counter = CountFarmers();

    counter.increment();

    expect(counter.value, 1);
  });
}