import 'package:ansicolor/ansicolor.dart';
import 'package:gator/gator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAnsiPen extends Mock implements AnsiPen {}

void main() {
  group('ansiColorizer writes colors string as expected', () {
    final pen = MockAnsiPen();

    tearDown(() => reset(pen));

    test('writes with a message', () {
      const message = 'message';
      when(() => pen.write(message)).thenReturn(message);
      ansiColorizer(
        color: const Color.rgb(0, 0, 0),
        message: message,
        ansiPen: pen,
      );
      verify(() => pen.write(message)).called(1);
    });

    test('writes with a color', () {
      when(
        () => pen.rgb(r: 0, g: 0, b: 0),
      ).thenReturn(() {}); // ignore: void_checks
      when(() => pen.write(any())).thenReturn('message');

      ansiColorizer(
        color: const Color.rgb(0, 0, 0),
        message: 'message',
        ansiPen: pen,
      );

      verify(() => pen.rgb(r: 0, g: 0, b: 0)).called(1);
    });
  });
}
