import 'package:gator/gator.dart';

/// Tints a single [Color] and returns the new tinted value.
Color colorTint(Color color, int i) => Color.rgb(
      (color.red + (255 - color.red) * i * 0.1).round(),
      (color.green + (255 - color.green) * i * 0.1).round(),
      (color.blue + (255 - color.blue) * i * 0.1).round(),
    );

/// Shades a single [Color] and returns the new shaded value.
Color colorShade(Color color, int i) => Color.rgb(
      (color.red * (1 - 0.1 * i)).round(),
      (color.green * (1 - 0.1 * i)).round(),
      (color.blue * (1 - 0.1 * i)).round(),
    );

/// Generator the given shader or tinter calculation.
List<Color> generate(Color color, Color Function(Color, int) shadeOrTint) {
  final shadeValues = <Color>[];
  for (var i = 0; i < 5; i++) {
    final shadeValue = shadeOrTint(color, i);
    shadeValues.add(shadeValue);
  }
  return shadeValues;
}

/// Generate all the shades and tints for the given colors
Map<ConfigColor, List<Color>> createTintsAndShades(
  Iterable<ConfigColor> colors,
) {
  final tintsShades = <ConfigColor, List<Color>>{};
  for (final color in colors) {
    tintsShades[color] = [
      ...generate(color, colorTint).reversed,
      ...generate(color, colorShade),
    ];
  }
  return tintsShades;
}
