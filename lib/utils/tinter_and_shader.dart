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

/// Generate all the shades and tints for the given colors
Map<ConfigColor, List<Color>> createTintsAndShades(
  Iterable<ConfigColor> colors,
) =>
    <ConfigColor, List<Color>>{
      for (final color in colors)
        color: [
          ...Iterable<Color>.generate(5, (i) => colorTint(color, 4 - i)),
          ...Iterable<Color>.generate(5, (i) => colorShade(color, i)),
        ]
    };
