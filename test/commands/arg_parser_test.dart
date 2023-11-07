import 'package:gator/gator.dart';
import 'package:test/test.dart';

void main() {
  group('argParser', () {
    test('contains [config], [output], amd [help] options', () {
      expect(argParser.options.containsKey('config'), isTrue);
      expect(argParser.options.containsKey('output'), isTrue);
      expect(argParser.options.containsKey('help'), isTrue);

      expect(argParser.options.length, equals(3));
    });
  });
}
