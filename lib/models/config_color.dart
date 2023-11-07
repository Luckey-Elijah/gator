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
    assert(hex.length > 5, '[hex.length] should be at least 6.');

    hex = hex.substring(hex.length - 6, hex.length);

    return ConfigColor(
      red: getInt(hex.substring(0, 2)),
      green: getInt(hex.substring(2, 4)),
      blue: getInt(hex.substring(4, 6)),
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
