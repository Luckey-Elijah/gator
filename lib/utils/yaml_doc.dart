import 'dart:io';

import 'package:yaml/yaml.dart';

/// Retrieve Yaml document with given path.
YamlMap yamlDoc(String path, [File? file]) {
  final yamlFile = file ?? File(path);
  final contents = yamlFile.readAsStringSync();
  final doc = loadYaml(contents) as YamlMap;
  return doc;
}
