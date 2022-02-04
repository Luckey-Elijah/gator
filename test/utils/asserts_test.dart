import 'package:gator/gator.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  test('assertFactor', () {
    expect(() => assertFactor(-1), throwsAssertionError);
    expect(() => assertFactor(101), throwsAssertionError);
  });

  test('assertValue', () {
    expect(() => assertValue(-1), throwsAssertionError);
    expect(() => assertValue(256), throwsAssertionError);
  });
}
