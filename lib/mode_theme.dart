library mode_theme;

import 'package:flutter/material.dart';

export 'mode_package/mode_color.dart';
export 'mode_package/mode_definiations.dart';
export 'mode_package/mode_theme.dart';

const Color Gainsboro = const Color(0xffdcdcdc);
const Color DimGrey = const Color(0xff808080);

enum TextKeys {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  caption,
  button,
  overline,
}

Map<TextKeys, double> textSizeMap = {
  TextKeys.headline1: 96.0,
  TextKeys.headline2: 60.0,
  TextKeys.headline3: 48.0,
  TextKeys.headline4: 32.0,
  TextKeys.headline5: 24.0,
  TextKeys.headline6: 20.0,
  TextKeys.subtitle1: 16.0,
  TextKeys.subtitle2: 14.0,
  TextKeys.bodyText1: 16.0,
  TextKeys.bodyText2: 14.0,
  TextKeys.button: 14.0,
  TextKeys.caption: 12.0,
  TextKeys.overline: 10.0,
};

Map<TextKeys, Color> textColorLightMode = {
  TextKeys.headline1: Colors.black,
  TextKeys.headline2: Colors.black,
  TextKeys.headline3: Colors.black,
  TextKeys.headline4: Colors.black,
  TextKeys.headline5: Colors.black,
  TextKeys.headline6: Colors.black,
  TextKeys.subtitle1: Colors.black,
  TextKeys.subtitle2: Colors.black,
  TextKeys.bodyText1: Colors.black,
  TextKeys.bodyText2: Colors.black,
  TextKeys.button: Colors.black,
  TextKeys.caption: Colors.black,
  TextKeys.overline: Colors.black,
};

Map<TextKeys, Color> textColorDarkMode = {
  TextKeys.headline1: Colors.yellow,
  TextKeys.headline2: Colors.yellow,
  TextKeys.headline3: Colors.yellow,
  TextKeys.headline4: Colors.yellow,
  TextKeys.headline5: Colors.yellow,
  TextKeys.headline6: Colors.yellow,
  TextKeys.subtitle1: Colors.yellow,
  TextKeys.subtitle2: Colors.yellow,
  TextKeys.bodyText1: Colors.yellow,
  TextKeys.bodyText2: Colors.yellow,
  TextKeys.button: Colors.yellow,
  TextKeys.caption: Colors.yellow,
  TextKeys.overline: Colors.yellow,
};
