import 'package:args/args.dart';

/// The arg parser used for the `gator` entry point.
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
    defaultsTo: 'colors.g.dart',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    negatable: false,
    help: 'Show this usage information.',
  );
