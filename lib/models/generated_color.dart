import 'package:equatable/equatable.dart';

/// {@template gen_color}
/// A generated color format.
/// {@endtemplate}
class GeneratedColor extends Equatable {
  /// {@macro gen_color}
  const GeneratedColor({
    required this.value,
    required this.shade,
  });

  /// The value of this color.
  /// Typically a hex value.
  final String value;

  /// The shade associated with this color.
  /// Typically between 0 - 1000.
  final int shade;

  /// Map representation of this color.
  Map<int, String> toMap() => {shade: value};

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [value, shade];
}
