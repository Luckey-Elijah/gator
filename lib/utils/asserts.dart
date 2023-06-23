/// Assert that the [factor] value is somewhere from `0` - `100`.
/// Will throw [InvalidValueRangeException] if not in range.
void assertFactor(int factor) {
  const range = (lower: 0, upper: 100);
  if (_inRange(range: range, value: factor)) return;
  throw InvalidValueRangeException(
    value: factor,
    range: range,
  );
}

/// Assert that the color value is somewhere from `0` - `255`.
/// Will throw [InvalidValueRangeException] if not in range.
void assertValue(int value) {
  const range = (lower: 0, upper: 255);
  if (_inRange(range: range, value: value)) return;
  throw InvalidValueRangeException(value: value, range: range);
}

/// {@template invalid_value_range_exception}
/// Exception for invalid integer ranges.
/// {@endtemplate}
class InvalidValueRangeException implements Exception {
  /// {@macro invalid_value_range_exception}
  InvalidValueRangeException({
    required this.range,
    required this.value,
  });

  /// Lower and upper limits of the allowed values.
  final ({num lower, num upper}) range;

  /// The actual value.
  final num value;

  /// Description of the exception.
  String get message => '$value is not in range of $range';

  @override
  String toString() {
    return 'InvalidValueRangeException($message)';
  }
}

/// Inclusive in range checker.
bool _inRange({
  required ({num lower, num upper}) range,
  required num value,
}) =>
    value >= range.lower && value <= range.upper;
