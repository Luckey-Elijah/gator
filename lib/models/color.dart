import 'package:equatable/equatable.dart';

/// {@template color}
/// An RGB color.
/// {@endtemplate}
class Color extends Equatable {
  /// {@macro color}
  const Color.rgb(this.red, this.green, this.blue)
      : assert(red < 256, '[red] must be less than 256'),
        assert(red >= 0, '[red] must be greater than or equal to 0'),
        assert(green >= 0, '[green] must be greater than or equal to 0'),
        assert(green < 256, '[green] must be less than 256'),
        assert(blue >= 0, '[blue] must be greater than or equal to 0'),
        assert(blue < 256, '[blue] must be less than 256');

  /// Red
  /// {@template color_value}
  /// color value for this color.
  /// {@endtemplate}
  final int red;

  /// Green
  /// {@macro color_value}
  final int green;

  /// Blue
  /// {@macro color_value}
  final int blue;

  /// The hex value calculated from [red], [blue], [green].
  String get hex => '0xff${_value.toRadixString(16).padLeft(6, '0')}';
  int get _value => int.parse(
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}',
        radix: 16,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [hex, red, green, blue];
}
