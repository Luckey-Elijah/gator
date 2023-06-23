import 'package:gator/gator.dart';
import 'package:test/test.dart';

void main() {
  test('assertFactor', () {
    expect(() => assertFactor(-1), throwsInvalidValueRangeException());
    expect(() => assertFactor(101), throwsInvalidValueRangeException());
  });

  test('assertValue', () {
    expect(() => assertValue(-1), throwsInvalidValueRangeException());
    expect(() => assertValue(256), throwsInvalidValueRangeException());
  });

  test('InvalidValueRangeException', () {
    final ex = InvalidValueRangeException(
      range: (lower: 0, upper: 1),
      value: 3,
    );
    const message = '3 is not in range of (lower: 0, upper: 1)';
    expect(ex.message, message);
    expect(ex.toString(), 'InvalidValueRangeException($message)');
  });
}

Matcher throwsInvalidValueRangeException() =>
    throwsA(isA<InvalidValueRangeException>());
