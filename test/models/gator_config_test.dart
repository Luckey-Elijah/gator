import 'package:gator/gator.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

import '../test_helpers.dart';

void main() {
  group('GatorConfig', () {
    test('const constructor', () {
      expect(
        const GatorConfig(className: '', colors: [], outputPath: ''),
        equals(const GatorConfig(className: '', colors: [], outputPath: '')),
      );
    });

    test('constructor assertion', () {
      expect(
        () => GatorConfig.fromYaml(YamlMap()),
        throwsAssertionError,
      );
    });
  });
}
