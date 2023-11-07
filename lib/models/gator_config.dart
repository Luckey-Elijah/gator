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
class GatorConfig {
  /// {@macro gator_config}
  const GatorConfig({
    required this.className,
    required this.colors,
    required this.outputPath,
  });

  /// {@macro gator_config}
  /// There the `gator` and `colors` entries are required from the YAML
  /// document.
  factory GatorConfig.fromYaml(YamlMap yamlMap) {
    if (yamlMap case {'gator': {'colors': final YamlMap yamlColors}}) {
      ConfigColor toConfigColor(dynamic colorKey) {
        return ConfigColor.fromHex(
          hex: '${yamlColors[colorKey]}',
          name: '$colorKey',
        );
      }

      final outputPath = switch (yamlMap['gator']) {
        {'output': final String? output} => output,
        _ => null,
      };

      final className = switch (yamlMap['gator']) {
        {'class': final String className} => className,
        _ => 'MyColors',
      };

      return GatorConfig(
        colors: yamlColors.keys.map<ConfigColor>(toConfigColor),
        outputPath: outputPath,
        className: className,
      );
    }

    throw InvalidGatorConfigException();
  }

  /// The name of class to be generated from the configuration.
  final String className;

  /// The optional output path for the generated file.
  final String? outputPath;

  /// All the colors adapted from the configuration.
  final Iterable<ConfigColor> colors;
}

/// {@template invalid_gator_config}
/// A generic exception for a given invalid [GatorConfig].
/// {@endtemplate}
/// {@macro invalid_gator_config}
class InvalidGatorConfigException implements Exception {
  /// {@macro invalid_gator_config}
  final message = '''
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
''';
}
