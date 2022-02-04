import 'package:gator/gator.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  group('ConfigColor', () {
    test('fromHex', () {
      final props = equals(const ['name', '0xff000000', 0, 0, 0]);
      expect(ConfigColor.fromHex(hex: '000000', name: 'name').props, props);
      expect(ConfigColor.fromHex(hex: '#000000', name: 'name').props, props);
      expect(ConfigColor.fromHex(hex: '0xff000000', name: 'name').props, props);
      expect(ConfigColor.fromHex(hex: '0xFF000000', name: 'name').props, props);
    });

    test('getInt', () {
      const <String, int>{
        '00': 0,
        '01': 1,
        '02': 2,
        '03': 3,
        'A3': 163,
        'C0': 192,
      }.forEach((hex, value) {
        expect(ConfigColor.getInt(hex), equals(value));
      });
    });

    test('fromHex constructor assertions', () {
      expect(
        () => ConfigColor.fromHex(hex: '123456', name: ''),
        throwsAssertionError,
        reason: 'An empty name should not be allowed.',
      );

      expect(
        () => ConfigColor.fromHex(hex: '12345', name: 'name'),
        throwsAssertionError,
        reason: 'A [hex] should have a length of [10], [7], or [6]',
      );

      expect(
        () => ConfigColor.fromHex(hex: '1234567890', name: 'name'),
        throwsAssertionError,
        reason: 'A [hex] of length [10] should start with [0xff].',
      );
      expect(
        () => ConfigColor.fromHex(hex: '1234567', name: 'name'),
        throwsAssertionError,
        reason: 'A [hex] of length [7] should start with [#].',
      );
    });
  });
}
