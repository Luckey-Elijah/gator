import 'dart:io';

import 'package:gator/gator.dart';
import 'package:mason_logger/mason_logger.dart';

void main(List<String> args) {
  final results = argParser.parse(args);
  final logger = Logger();
  final command = GatorCommand(results: results, logger: logger);
  if (results.wasParsed('help')) {
    logger
      ..info(command.summary)
      ..info('')
      ..info(argParser.usage);
    exit(0);
  }
  exit(command.run());
}
