import 'package:flutter/material.dart' show Color, MaterialColor;

class MyColors {
  MyColors._();

  static const _royalBluePrimaryValue = 0xff062091;

  static const royalBlue = MaterialColor(
    _royalBluePrimaryValue,
    <int, Color>{
      050: Color(0xff6a79bd),
      100: Color(0xff5163b2),
      200: Color(0xff384da7),
      300: Color(0xff1f369c),
      400: Color(0xff062091),
      500: Color(_royalBluePrimaryValue),
      600: Color(0xff051d83),
      700: Color(0xff051a74),
      800: Color(0xff041666),
      900: Color(0xff041357),
    },
  );

  static const _greyPrimaryValue = 0xffd6d6d6;

  static const grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      050: Color(0xffe6e6e6),
      100: Color(0xffe2e2e2),
      200: Color(0xffdedede),
      300: Color(0xffdadada),
      400: Color(0xffd6d6d6),
      500: Color(_greyPrimaryValue),
      600: Color(0xffc1c1c1),
      700: Color(0xffababab),
      800: Color(0xff969696),
      900: Color(0xff808080),
    },
  );

  static const _rebeccaPurplePrimaryValue = 0xff663399;

  static const rebeccaPurple = MaterialColor(
    _rebeccaPurplePrimaryValue,
    <int, Color>{
      050: Color(0xffa385c2),
      100: Color(0xff9470b8),
      200: Color(0xff855cad),
      300: Color(0xff7547a3),
      400: Color(0xff663399),
      500: Color(_rebeccaPurplePrimaryValue),
      600: Color(0xff5c2e8a),
      700: Color(0xff52297a),
      800: Color(0xff47246b),
      900: Color(0xff3d1f5c),
    },
  );
}
