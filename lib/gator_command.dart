import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:gator/gator.dart';
import 'package:mason_logger/mason_logger.dart';

const _tintFactors = [5, 10, 20, 30, 40];
const _shadeFactors = [60, 70, 80, 90];

/// {@template gator_command}
/// Entry point for running the `gator` executable.
/// {@endtemplate}
class GatorCommand extends Command<int> {
  /// {@macro gator_command}
  GatorCommand({
    required ArgResults results,
    Logger? logger,
    DartFormatter? dartFormatter,
    DartEmitter? dartEmitter,
  })  : _results = results,
        _logger = logger ?? Logger(),
        _emitter = dartEmitter ?? DartEmitter(),
        _formatter = dartFormatter ?? DartFormatter();

  final Logger _logger;
  final DartFormatter _formatter;
  final DartEmitter _emitter;
  final ArgResults _results;

  @override
  int run() {
    final configSource = _results['config'] as String;
    final output = _results['output'] as String;
    try {
      final yaml = yamlDoc(configSource, _logger);
      final config = GatorConfig.fromYaml(yaml);
      final fields = _buildFieldsForColor(config.colors);
      final constructors = [Constructor((b) => b.name = '_')];
      final directive = Directive(
        (b) => b
          ..type = DirectiveType.import
          ..url = 'package:flutter/material.dart'
          ..show = ['Color', 'MaterialColor'],
      );

      final generatedClass = Class(
        (b) => b
          ..constructors = ListBuilder<Constructor>(constructors)
          ..name = config.className
          ..fields = ListBuilder<Field>(fields),
      );

      final library = Library(
        (b) => b
          ..body = ListBuilder(<Spec>[generatedClass])
          ..directives = ListBuilder(<Directive>[directive]),
      );

      final generatedCode = _formatter.format(
        '${library.accept(_emitter)}',
      );

      File(output)
        ..writeAsStringSync(generatedCode)
        ..createSync();

      return 0;
    } catch (e, s) {
      _logger
        ..warn(e.toString())
        ..warn(s.toString());
      return 1;
    }
  }

  List<Field> _buildFieldsForColor(Iterable<ConfigColor> colors) {
    final fields = <Field>[];

    for (final color in colors) {
      final primaryValueField = Field((b) {
        b
          ..static = true
          ..modifier = FieldModifier.constant
          ..type = const Reference('int')
          ..name = '_${color.name}PrimaryValue'
          ..assignment = Code(color.hex);
      });

      fields.add(primaryValueField);

      final swatchColorField = Field((b) {
        b
          ..static = true
          ..modifier = FieldModifier.constant
          ..name = color.name
          ..assignment = _swatchBuilder(primaryValueField, color);
      });

      fields.add(swatchColorField);
    }
    return fields;
  }

  Code _swatchBuilder(Field primaryValueField, ConfigColor color) {
    return Code(
      '''
MaterialColor(
  ${primaryValueField.name},
  <int, Color>{
    ${colorSetMapper(color: color, updater: tinter, factorSet: _tintFactors)}
    500: Color(${primaryValueField.name}),
    ${colorSetMapper(color: color, updater: shader, factorSet: _shadeFactors)}
  },
)
            ''',
    );
  }

  @override
  String get description =>
      'Generate shades and tints from primary colors values.';

  @override
  String get name => 'gator';
}
