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
    });
  });
}
