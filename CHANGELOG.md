# CHANGELOG

## 1.5.0

- update dart to `3.5.0`
- upgrade dependencies

## 1.4.0

- makes `AnsiPen ansiPen` required in `ansiColorizer`
- `GatorConfig` default now has default constructor
- `GatorConfig` is not longer extending `Equatable`
- Improved `GatorConfig.fromYaml` parsing.

## 1.3.1

- adds `--help` flag

  ```sh
  $ gator --help
  Generate shades and tints from primary colors hex values for easy setup.

  -c, --config    path of the config yaml file
                  (defaults to "pubspec.yaml")
  -o, --output    path of the generated file
                  (defaults to "colors.g.dart")
  -h, --help      Show this usage information.
  ```

## 1.3.0

- Upgrade to Dart 3
- Updates analysis
- Adds `InvalidValueRangeException`
- `assertFactor` and `assertValue` will now throw `InvalidValueRangeException` when not in correct range

## 1.2.2

- Lists colorized, generated colors in terminal

  ```sh
  $ gator -c colors.yaml
  Generated Material Color (0xff062091) Royal Blue
  Generated Material Color (0xffd6d6d6) Grey
  Generated Material Color (0xff663399) Rebecca Purple
  🖍 Created file: my_colors.g.dart!
  ```

## 1.2.1

- Adds better error messages
- improvement on shade generation performance

## 1.2.0

- Adds `output` feature for config
- Fixes order or shades generated
- Some better code ge options

## 1.0.1

- Corrects some spelling mistakes

## 1.0.0

- Initial release
