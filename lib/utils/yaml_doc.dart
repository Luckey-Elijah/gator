import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:yaml/yaml.dart';

/// Retrieve Yaml document with given path.
YamlMap yamlDoc(String path, Logger logger) {
  final colorFile = File(path);
  final contents = colorFile.readAsStringSync();
  final doc = loadYaml(contents) as YamlMap;
  return doc;
}
