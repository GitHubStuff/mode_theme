import 'package:flutter/material.dart';

import '../mode_theme.dart';
import 'mode_color.dart';

const Color Gainsboro = const Color(0xffdcdcdc);
const Color DimGrey = const Color(0xff808080);

class ModeDefiniation {
  static ModeColor buttonModeColor = ModeColor(light: Colors.lightBlue, dark: Colors.deepPurple);

  static ModeColor dialogModeColor = ModeColor(light: Gainsboro, dark: Colors.deepPurple);

  /// Color pair for primaryColor in a theme
  static ModeColor primaryModeColor = ModeColor(light: Colors.green, dark: Colors.grey);

  /// Color pair to have an app-specific coloring for widgets
  static ModeColor productModeColor = ModeColor(light: Colors.orangeAccent, dark: Colors.amber);

  /// Color pair for the background of scaffold (the screen palette)
  static ModeColor scaffoldColors = ModeColor(light: Colors.white, dark: Colors.black);

  /// The typography used throughout an app (iOS is just better looking)
  static final Typography _kTypography = Typography.material2018(platform: TargetPlatform.iOS);

  static const String displayFontFamily = '.SF UI Display'; //'Roboto';
  static const String textFontFamily = '.SF UI Text';

  /// Constructor to create BRIGHT-mode theme data with all the variations detailed by the swatches and text builds
  static ThemeData bright() {
    return _setter(brightness: Brightness.light);
  }

  /// Constructor to create DARK-mode theme data with all the variations detailed by the swatches and text builds
  static ThemeData dark() {
    return _setter(brightness: Brightness.dark);
  }

  static CircularProgressIndicator _circularProgressIndicator;

  static CircularProgressIndicator getCircularProgressIndicator(BuildContext context, {ModeColor colors}) {
    final color = (colors ?? productModeColor).color(context);
    return _circularProgressIndicator ??
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        );
  }

  static void setCircularProgressIndicator(CircularProgressIndicator indicator) =>
      _circularProgressIndicator = indicator;

  /// Color pair for icon color
  static ModeColor iconColors = ModeColor(light: Colors.black87, dark: Colors.white70);

  /// Color pair to add brightness to icons to make sure they are visible in light/dark modes
  ///
  static ModeColor iconBrightness = ModeColor(light: Colors.grey, dark: Colors.black45);

  /// Common background constructor creates Theme data for light and dark modes
  static ThemeData _setter({Brightness brightness}) {
    final isBright = (brightness == Brightness.light);
    return ThemeData().copyWith(
      accentColor: isBright ? productModeColor.light : productModeColor.dark,
      //accentIconTheme: IconThemeData(color: isBright ? iconColors.light : iconColors.dark),
      brightness: isBright ? Brightness.light : Brightness.dark,
      buttonTheme: isBright ? _buttonStyleBright : _buttonStyleDark,
      buttonColor: isBright ? buttonModeColor.light : buttonModeColor.dark,
      cardColor: isBright ? DimGrey : Colors.black87,
      dialogBackgroundColor: isBright ? dialogModeColor.light : dialogModeColor.dark,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: isBright ? buttonModeColor.light : buttonModeColor.dark),
      iconTheme: IconThemeData(color: isBright ? iconColors.light : iconColors.dark),
      inputDecorationTheme: !isBright ? _inputDecorationThemeBright() : _inputDecorationThemeDark(),
      primaryColor: isBright ? primaryModeColor.light : primaryModeColor.dark,
      primaryIconTheme: isBright ? _iconThemeDataBright() : _iconThemeDataDark(),
      scaffoldBackgroundColor: isBright ? scaffoldColors.light : scaffoldColors.dark,
      textTheme: isBright ? _kTextThemeWhite : _kTextThemeBlack, // : _kTextThemeWhite,
    );
  }

  static IconThemeData _iconThemeDataBright() => IconThemeData(color: iconBrightness.light);
  static IconThemeData _iconThemeDataDark() => IconThemeData(color: iconBrightness.dark);

  static InputDecorationTheme _inputDecorationThemeBright() => InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: contrastColors.dark),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: contrastColors.dark),
      ),
      hintStyle: TextStyle(color: contrastColors.dark),
      labelStyle: TextStyle(color: contrastColors.dark));

  static InputDecorationTheme _inputDecorationThemeDark() => InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: contrastColors.light),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: contrastColors.light),
      ),
      hintStyle: TextStyle(color: contrastColors.light),
      labelStyle: TextStyle(color: contrastColors.light));

  /// Color pair that has the highest contracts in colors (eg: Brightness.Light would have a contrast of Colors.black)
  static ModeColor contrastColors = ModeColor(light: Colors.black87, dark: Colors.white54);

  /// Internal state for button themes
  static ButtonThemeData _buttonStyleBright = ButtonThemeData(
    buttonColor: buttonModeColor.light,
    disabledColor: disabledColors.light,
    height: 42.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );

  static ButtonThemeData _buttonStyleDark = ButtonThemeData(
    buttonColor: buttonModeColor.dark,
    disabledColor: disabledColors.dark,
    height: 42.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );

  /// Color pair when widget (eg a button) is disabled
  static ModeColor disabledColors = ModeColor(light: Colors.grey, dark: Colors.blueGrey);

  static final TextTheme _kTextThemeWhite = _kTypography.white.copyWith(
    headline1: _kTypography.white.headline1.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline1],
      color: textColorLightMode[TextKeys.headline1],
    ),
    headline2: _kTypography.white.headline2.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline2],
      color: textColorLightMode[TextKeys.headline2],
    ),
    headline3: _kTypography.white.headline3.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline3],
      color: textColorLightMode[TextKeys.headline3],
    ),
    headline4: _kTypography.white.headline4.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline4],
      color: textColorLightMode[TextKeys.headline4],
    ),
    headline5: _kTypography.white.headline5.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline5],
      color: textColorLightMode[TextKeys.headline5],
    ),
    headline6: _kTypography.white.headline6.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline6],
      color: textColorLightMode[TextKeys.headline6],
    ),
    subtitle1: _kTypography.white.subtitle1.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.subtitle1],
      color: textColorLightMode[TextKeys.subtitle1],
    ),
    subtitle2: _kTypography.white.subtitle2.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.subtitle2],
      color: textColorLightMode[TextKeys.subtitle2],
    ),
    bodyText1: _kTypography.white.bodyText1.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.bodyText1],
      color: textColorLightMode[TextKeys.bodyText1],
    ),
    bodyText2: _kTypography.white.bodyText2.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.bodyText2],
      color: textColorLightMode[TextKeys.bodyText2],
    ),
    caption: _kTypography.white.caption.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.caption],
      color: textColorLightMode[TextKeys.caption],
    ),
    button: _kTypography.white.button.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.button],
      color: textColorLightMode[TextKeys.button],
    ),
    overline: _kTypography.white.overline.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.overline],
      color: textColorLightMode[TextKeys.overline],
    ),
  );

  static final TextTheme _kTextThemeBlack = _kTypography.black.copyWith(
    headline1: _kTypography.black.headline1.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline1],
      color: textColorDarkMode[TextKeys.headline1],
    ),
    headline2: _kTypography.black.headline2.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline2],
      color: textColorDarkMode[TextKeys.headline2],
    ),
    headline3: _kTypography.black.headline3.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline3],
      color: textColorDarkMode[TextKeys.headline3],
    ),
    headline4: _kTypography.black.headline4.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline4],
      color: textColorDarkMode[TextKeys.headline4],
    ),
    headline5: _kTypography.black.headline5.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline5],
      color: textColorDarkMode[TextKeys.headline5],
    ),
    headline6: _kTypography.black.headline6.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.headline6],
      color: textColorDarkMode[TextKeys.headline6],
    ),
    subtitle1: _kTypography.black.subtitle1.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.subtitle1],
      color: textColorDarkMode[TextKeys.subtitle1],
    ),
    subtitle2: _kTypography.black.subtitle2.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.subtitle2],
      color: textColorDarkMode[TextKeys.subtitle2],
    ),
    bodyText1: _kTypography.black.bodyText1.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.bodyText1],
      color: textColorDarkMode[TextKeys.bodyText1],
    ),
    bodyText2: _kTypography.black.bodyText2.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.bodyText2],
      color: textColorDarkMode[TextKeys.bodyText2],
    ),
    caption: _kTypography.black.caption.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.caption],
      color: textColorDarkMode[TextKeys.caption],
    ),
    button: _kTypography.black.button.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.button],
      color: textColorDarkMode[TextKeys.button],
    ),
    overline: _kTypography.black.overline.copyWith(
      fontFamily: displayFontFamily,
      fontSize: textSizeMap[TextKeys.overline],
      color: textColorDarkMode[TextKeys.overline],
    ),
  );
}
