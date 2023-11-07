import 'package:gator/gator.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('GatorConfig', () {
    test('const constructor', () {
      expect(
        const GatorConfig(className: '', colors: [], outputPath: ''),
        equals(const GatorConfig(className: '', colors: [], outputPath: '')),
      );
    });

    group('fromYaml', () {
      test('constructor assertion: no "gator"', () {
        expect(
          () => GatorConfig.fromYaml(YamlMap.wrap({})),
          throwsA(isA<InvalidGatorConfigException>()),
        );
      });

      test('constructor assertion: no "colors"', () {
        expect(
          () => GatorConfig.fromYaml(
            YamlMap.wrap({'gator': <String, dynamic>{}}),
          ),
          throwsA(isA<InvalidGatorConfigException>()),
        );
      });

      test('builds valid config: no class, no output', () {
        final config = GatorConfig.fromYaml(
          YamlMap.wrap({
            'gator': <String, dynamic>{
              'colors': <String, dynamic>{},
            },
          }),
        );
        expect(config.className, equals('MyColors'));
        expect(config.outputPath, equals(null));
        expect(config.colors.isEmpty, isTrue);
      });

      test('builds valid config: no class, no output', () {
        final config = GatorConfig.fromYaml(
          YamlMap.wrap({
            'gator': <String, dynamic>{
              'colors': <String, dynamic>{},
              'class': 'TestClass',
              'output': 'test/path.g.dart',
            },
          }),
        );
        expect(config.className, equals('TestClass'));
        expect(config.outputPath, equals('test/path.g.dart'));
        expect(config.colors.isEmpty, isTrue);
      });

      test('builds valid config: no output', () {
        final config = GatorConfig.fromYaml(
          YamlMap.wrap({
            'gator': <String, dynamic>{
              'colors': <String, dynamic>{},
              'class': 'TestClass',
            },
          }),
        );
        expect(config.className, equals('TestClass'));
        expect(config.outputPath, equals(null));
        expect(config.colors.isEmpty, isTrue);
      });

      test('builds valid config: no class', () {
        final config = GatorConfig.fromYaml(
          YamlMap.wrap({
            'gator': <String, dynamic>{
              'colors': <String, dynamic>{},
              'output': 'test/path.g.dart',
            },
          }),
        );
        expect(config.className, equals('MyColors'));
        expect(config.outputPath, equals('test/path.g.dart'));
        expect(config.colors.isEmpty, isTrue);
      });
    });
  });
}
