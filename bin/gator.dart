import 'package:args/args.dart';
import 'package:gator/gator.dart';

void main(List<String> args) {
  final argParser = ArgParser()
    ..addOption(
      'config',
      abbr: 'c',
      help: 'path of the config yaml file',
      defaultsTo: 'pubspec.yaml',
    )
    ..addOption(
      'output',
      abbr: 'o',
      help: 'path of the generated file',
      defaultsTo: 'colors.dart',
    );

  final results = argParser.parse(args);

  GatorCommand(results: results).run();
}
