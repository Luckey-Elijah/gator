import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:gator/gator.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:recase/recase.dart';

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
    final resultsOutput = _results['output'] as String;
    try {
      final yaml = yamlDoc(configSource);
      final config = GatorConfig.fromYaml(yaml);
      final colors = createTintsAndShades(config.colors);

      final _output = config.outputPath ?? resultsOutput;

      final fields = _buildFieldsForColor(colors);
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
          ..name = config.className.pascalCase
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

      File(_output)
        ..writeAsStringSync(generatedCode)
        ..createSync(recursive: true);

      return 0;
    } on FileSystemException catch (e) {
      _logger.err('${e.message} ${e.path}');
      return 1;
    } catch (e, s) {
      _logger
        ..warn(e.toString())
        ..warn(s.toString());
      return 1;
    }
  }

  List<Field> _buildFieldsForColor(
    Map<ConfigColor, List<Color>> colors,
  ) {
    final fields = <Field>[];
    const materialShadeKeys = [
      '050', '100', '200', '300', '400', //
      '500', '600', '700', '800', '900',
    ];
    colors.forEach(
      (configColor, shadeColors) {
        assert(
          shadeColors.length == 10,
          'Expected [shadeColors.length] to equal 10. '
          'Actually: [shadeColors.length]: ${shadeColors.length}',
        );

        final fieldName = configColor.name.camelCase;
        final primaryFieldName = '_${fieldName}PrimaryValue';

        final primaryValueField = Field((b) {
          b
            ..static = true
            ..modifier = FieldModifier.constant
            ..name = primaryFieldName
            ..assignment = Code(configColor.hex);
        });

        final buffer = StringBuffer();

        for (var i = 0; i < 10; i++) {
          final key = materialShadeKeys[i];
          if (key == '500') {
            buffer.writeln('$key: Color($primaryFieldName),');
          } else {
            buffer.writeln('$key: Color(${shadeColors[i].hex}),');
          }
        }

        final materialColorField = Field((b) {
          b
            ..static = true
            ..modifier = FieldModifier.constant
            ..name = fieldName
            ..assignment = Code(
              'MaterialColor($primaryFieldName, <int, Color>{$buffer},)',
            );
        });

        fields.addAll([primaryValueField, materialColorField]);
      },
    );

    return fields;
  }

  @override
  String get description => 'Generate shades and tints from primary colors hex '
      'values for easy setup.';

  @override
  String get name => 'gator';
}
