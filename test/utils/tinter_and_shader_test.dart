import 'package:gator/gator.dart';
import 'package:test/test.dart';

void main() {
  test('colorTint', () {
    expect(
      colorTint(const Color.rgb(2, 2, 2), 1),
      equals(const Color.rgb(27, 27, 27)),
    );
  });

  test('colorShade', () {
    expect(
      colorShade(const Color.rgb(26, 26, 26), 1),
      equals(const Color.rgb(23, 23, 23)),
    );
  });

  test('createTintsAndShades', () {
    const configColor = ConfigColor(red: 26, green: 26, blue: 26, name: 'name');
    final actual = createTintsAndShades([configColor]);
    final matcher = <ConfigColor, List<Color>>{
      configColor: const <Color>[
        Color.rgb(118, 118, 118),
        Color.rgb(95, 95, 95),
        Color.rgb(72, 72, 72),
        Color.rgb(49, 49, 49),
        Color.rgb(26, 26, 26),
        Color.rgb(26, 26, 26),
        Color.rgb(23, 23, 23),
        Color.rgb(21, 21, 21),
        Color.rgb(18, 18, 18),
        Color.rgb(16, 16, 16),
      ],
    };

    expect(actual, matcher);
  });
}
