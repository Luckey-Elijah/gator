import 'package:ansicolor/ansicolor.dart';
import 'package:gator/gator.dart';

final _ansiPen = AnsiPen();

/// Creates an ansi-compatible colored message from the color provided.
String ansiColorizer({
  required Color color,
  required String message,
  AnsiPen? ansiPen,
}) {
  final pen = (ansiPen ?? _ansiPen)
    ..rgb(
      r: color.red / 255,
      g: color.green / 255,
      b: color.blue / 255,
    );
  return pen.write(message);
}
