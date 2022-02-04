import 'dart:io';

import 'package:gator/utils/utils.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  test('yamlDoc', () {
    final cwd = Directory.current.path;
    const contents = '''
gator:
  class: MyColors
  colors:
    royalBlue: '0xff062091'
    grey: '#d6d6d6'
    rebeccaPurple: '663399'
''';

    final path = join(cwd, 'colors.yaml');
    final file = File(path)..writeAsStringSync(contents);
    final doc = yamlDoc(path, file);

    expect(doc.containsKey('gator'), isTrue);

    final gatorMap = doc['gator'] as YamlMap;
    expect(gatorMap.containsKey('colors'), isTrue);

    final colorsMap = gatorMap['colors'] as YamlMap;
    expect(colorsMap.containsKey('royalBlue'), isTrue);
    expect(colorsMap.containsKey('grey'), isTrue);
    expect(colorsMap.containsKey('rebeccaPurple'), isTrue);

    expect(colorsMap['royalBlue'], '0xff062091');
    expect(colorsMap['grey'], '#d6d6d6');
    expect(colorsMap['rebeccaPurple'], '663399');

    expect(gatorMap.containsKey('class'), isTrue);
    expect(gatorMap['class'] as String, 'MyColors');
  });
}
