library mode_theme;

export 'mode_package/mode_color.dart';
export 'mode_package/mode_definiations.dart';
export 'mode_package/mode_theme.dart';

enum TextSizes {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overline,
}

Map<TextSizes, double> textSizeMap = {
  TextSizes.headline1: 96.0,
  TextSizes.headline2: 60.0,
  TextSizes.headline3: 48.0,
  TextSizes.headline4: 32.0,
  TextSizes.headline5: 24.0,
  TextSizes.headline6: 20.0,
  TextSizes.subtitle1: 16.0,
  TextSizes.subtitle2: 14.0,
  TextSizes.body1: 16.0,
  TextSizes.body2: 14.0,
  TextSizes.button: 14.0,
  TextSizes.caption: 12.0,
  TextSizes.overline: 10.0,
};
