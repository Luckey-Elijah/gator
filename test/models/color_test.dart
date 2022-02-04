import 'package:gator/gator.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  group('Color', () {
    test('constructor assertions', () {
      expect(() => Color.rgb(-1, 0, 0), throwsAssertionError);
      expect(() => Color.rgb(256, 0, 0), throwsAssertionError);
      expect(() => Color.rgb(0, -1, 0), throwsAssertionError);
      expect(() => Color.rgb(0, 256, 0), throwsAssertionError);
      expect(() => Color.rgb(0, 0, -1), throwsAssertionError);
      expect(() => Color.rgb(0, 0, 256), throwsAssertionError);
    });

    test('hex', () {
      expect(const Color.rgb(0, 0, 0).hex, equals('0xff000000'));
      expect(const Color.rgb(66, 135, 245).hex, equals('0xff4287f5'));
      expect(const Color.rgb(79, 102, 97).hex, equals('0xff4f6661'));
      expect(const Color.rgb(105, 35, 47).hex, equals('0xff69232f'));
    });

    test(
      'props',
      () => expect(const Color.rgb(0, 0, 0).props, ['0xff000000', 0, 0, 0]),
    );
  });
}
