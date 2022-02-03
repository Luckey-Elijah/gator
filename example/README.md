# Example

Configuration:

```yaml
gator:
  class: MyColors
  colors:
    royalBlue: '0xff062091'
    grey: '#d6d6d6'
    rebeccaPurple: '663399'
```

Run:

```sh
gator -c colors.yaml -o example.dart
```

Generates:

```dart
import 'package:flutter/material.dart' show Color, MaterialColor;

class MyColors {
  MyColors._();

  static const int _royalBluePrimaryValue = 0xff062091;
  static const royalBlue = MaterialColor(
    _royalBluePrimaryValue,
    <int, Color>{
      050: Color(0xff122b97),
      100: Color(0xff1f369c),
      200: Color(0xff384da7),
      300: Color(0xff5163b2),
      400: Color(0xff6a79bd),
      500: Color(_royalBluePrimaryValue),
      600: Color(0xff041357),
      700: Color(0xff041666),
      800: Color(0xff051a74),
      900: Color(0xff051d83),
    },
  );

  static const int _greyPrimaryValue = 0xffd6d6d6;
  static const grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      050: Color(0xffd8d8d8),
      100: Color(0xffdadada),
      200: Color(0xffdedede),
      300: Color(0xffe2e2e2),
      400: Color(0xffe6e6e6),
      500: Color(_greyPrimaryValue),
      600: Color(0xff808080),
      700: Color(0xff969696),
      800: Color(0xffababab),
      900: Color(0xffc1c1c1),
    },
  );

  static const int _rebeccaPurplePrimaryValue = 0xff663399;
  static const rebeccaPurple = MaterialColor(
    _rebeccaPurplePrimaryValue,
    <int, Color>{
      050: Color(0xff6e3d9e),
      100: Color(0xff7547a3),
      200: Color(0xff855cad),
      300: Color(0xff9470b8),
      400: Color(0xffa385c2),
      500: Color(_rebeccaPurplePrimaryValue),
      600: Color(0xff3d1f5c),
      700: Color(0xff47246b),
      800: Color(0xff52297a),
      900: Color(0xff5c2e8a),
    },
  );
}
```
