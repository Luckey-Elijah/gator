import 'package:gator/gator.dart';

void main(List<String> args) {
  final results = argParser.parse(args);
  GatorCommand(results: results).run();
}
