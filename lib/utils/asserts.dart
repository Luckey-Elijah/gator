/// Assert that the [factor] value is somewhere from `0` - `100`.
void assertFactor(int factor) {
  assert(
    factor > -1 && factor < 101,
    '[factor] must be between -1 and 101',
  );
}

/// Assert that the color value is somewhere from `0` - `255`
void assertValue(int value) {
  assert(
    value > -1 && value < 256,
    '[value] must be between -1 and 256',
  );
}
