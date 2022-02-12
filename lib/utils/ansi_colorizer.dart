import 'package:ansicolor/ansicolor.dart';
import 'package:gator/gator.dart';

/// Creates an ansi-compatable colored message from the color provided.
String ansiColorizer({
  required Color color,
  required String message,
}) {
  final pen = AnsiPen()
    ..rgb(
      r: color.red / 255,
      g: color.green / 255,
      b: color.blue / 255,
    );
  return pen.write(message);
}
