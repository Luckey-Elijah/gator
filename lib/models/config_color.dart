import 'package:gator/gator.dart';
import 'package:meta/meta.dart';

/// {@template config_color}
/// A [Color] that is adapted from a configuration.
/// {@endtemplate}
class ConfigColor extends Color {
  /// {@macro config_color}
  const ConfigColor({
    required int red,
    required int green,
    required int blue,
    required this.name,
  }) : super.rgb(red, green, blue);

  /// A Color created from a hexadecimal value. Accepted formats include:
  /// - `0ff6002ee`
  /// - `#6002ee`
  /// - `6002ee`
  ///
  /// And is case insensitive.
  /// {@macro config_color}
  factory ConfigColor.fromHex({
    required String hex,
    required String name,
  }) {
    assert(name.isNotEmpty, '[name] cannot be empty.');
    assert(
      hex.length == 10 || hex.length == 7 || hex.length == 6,
      '[hex.length] should be 10, 7, or 6',
    );

    if (hex.length == 10) {
      assert(
        hex.toLowerCase().startsWith('0xff'),
        '[hex.length] of 10 should follow the format: "0xffRRGGBB"',
      );
      hex = hex.substring(4, hex.length);
    }

    if (hex.length == 7) {
      assert(
        hex.startsWith('#'),
        '[hex.length] of 7 should follow the format: "0xffRRGGBB"',
      );
      hex = hex.substring(1, hex.length);
    }

    final redHex = hex.substring(0, 2);
    final red = getInt(redHex);

    final greenHex = hex.substring(2, 4);
    final green = getInt(greenHex);

    final blueHex = hex.substring(4, 6);
    final blue = getInt(blueHex);

    return ConfigColor(
      red: red,
      green: green,
      blue: blue,
      name: name,
    );
  }

  /// Convert the hex string into a base-10 integer.
  @visibleForTesting
  static int getInt(String hex) => int.parse(hex, radix: 16);

  /// The name of this color.
  final String name;

  @override
  List<Object?> get props => [name, ...super.props];
}
