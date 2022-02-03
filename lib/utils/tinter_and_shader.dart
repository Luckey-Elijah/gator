import 'package:gator/gator.dart';

/// Calculate a tint value for a singe red, green, or, blue value.
///
/// {@template calc_value_assertion}
/// [value] must be between `-1` and `256`.
/// [factor] must be between `-1` and `101`.
/// {@endtemplate}
int tinter(int value, int factor) {
  _assertValue(value);
  _assetFactor(factor);
  final tintFactor = factor / 100;
  final offSet = 255 - value;
  final lighterValue = value + (offSet * tintFactor);
  return lighterValue.round();
}

/// Calculate a shade value for a singe red, green, or, blue value.
///
/// {@macro calc_value_assertion}
int shader(int value, int factor) {
  _assertValue(value);
  _assetFactor(factor);
  return (value * (factor / 100)).round();
}

void _assetFactor(int factor) {
  assert(
    factor > -1 && factor < 101,
    '[factor] must be between -1 and 101',
  );
}

void _assertValue(int value) {
  assert(
    value > -1 && value < 256,
    '[value] must be between -1 and 256',
  );
}

/// Create a series of mapped shades and/or tints based on a given [factorSet] and
/// [updater] from a [color].
String colorSetMapper({
  required ConfigColor color,
  required int Function(int, int) updater,
  required Iterable<int> factorSet,
}) {
  final buffer = StringBuffer();

  for (final factor in factorSet) {
    final red = updater(color.red, factor);
    final green = updater(color.green, factor);
    final blue = updater(color.blue, factor);

    final updatedColor = Color(red: red, green: green, blue: blue);
    buffer.write(
      '${factor.toString().padLeft(2, '0').padRight(3, '0')} : '
      'Color(${updatedColor.hex}),',
    );
  }
  return buffer.toString();
}
