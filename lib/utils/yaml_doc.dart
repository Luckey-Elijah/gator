import 'dart:io';

import 'package:yaml/yaml.dart';

/// Retrieve Yaml document with given path.
YamlMap yamlDoc(File file) {
  final yamlFile = file;
  final contents = yamlFile.readAsStringSync();
  final doc = loadYaml(contents) as YamlMap;
  return doc;
}
