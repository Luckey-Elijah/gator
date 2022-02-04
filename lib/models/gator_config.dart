import 'package:equatable/equatable.dart';
import 'package:gator/gator.dart';
import 'package:yaml/yaml.dart';

/// {@template gator_config}
/// The configuration that represents the YAML document.
///
/// Example yaml:
/// ```yaml
/// gator:
///   class: MyColors
///   colors:
///     royalBlue: '0xff062091'
///     grey: '#ffd6d6d6'
/// ```
/// {@endtemplate}
class GatorConfig extends Equatable {
  const GatorConfig._({
    required this.className,
    required this.colors,
    required this.outputPath,
  });

  /// {@macro gator_config}
  /// There the `gator` and `colors` entries are required from the YAML
  /// document.
  factory GatorConfig.fromYaml(YamlMap yamlDoc) {
    assert(
      yamlDoc['gator'] != null,
      '''
A "gator" entry must be specified.
Example:

```yaml
gator:
  class: MyColors
  output: example/colors.g.dart
  colors:
    royalBlue: '0xff062091'
    grey: '#d6d6d6'
    rebeccaPurple: '663399'```
''',
    );

    final shaderConfig = yamlDoc['gator'] as YamlMap;
    final yamlColors = shaderConfig['colors'] as YamlMap;
    final className = shaderConfig['class'] as String?;
    final outputPath = shaderConfig['output'] as String?;
    final decodedColors = yamlColors.keys.cast<String>().map<ConfigColor>(
          (String color) => ConfigColor.fromHex(
            hex: yamlColors[color] as String,
            name: color,
          ),
        );

    return GatorConfig._(
      outputPath: outputPath,
      colors: decodedColors,
      className: className ?? 'MyColors',
    );
  }

  /// The name of class to be generated from the configuration.
  final String className;

  /// The optional output path for the generated file.
  final String? outputPath;

  /// All the colors adapted from the configuration.
  final Iterable<ConfigColor> colors;

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [className, colors];
}
