import 'package:flutter/material.dart';

/// Wrapper class for colors pairs for bright/light and dark modes
class ModeColor {
  /// Create getter to prevent changes after instance creation
  Color get light => _light;
  Color get dark => _dark;
  Color _light;
  Color _dark;

  ModeColor({@required Color light, @required Color dark, double alpha = 1.0, double darkAlpha}) {
    assert(light != null);
    assert(dark != null);
    assert(alpha != null && (alpha >= 0.0 || alpha <= 1.0));
    int red = light.red;
    int green = light.green;
    int blue = light.blue;
    _light = Color.fromARGB((255.0 * alpha).toInt(), red, green, blue);
    red = dark.red;
    green = dark.green;
    blue = dark.blue;
    _dark = Color.fromARGB((255.0 * (darkAlpha ?? alpha)).toInt(), red, green, blue);
  }

  factory ModeColor.mono(Color color, {double alpha = 1.0}) {
    return ModeColor(light: color, dark: color, alpha: alpha);
  }

  Color color(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return _colorFor(brightness: brightness);
  }

  Color _colorFor({Brightness brightness}) {
    return (brightness == Brightness.light) ? light : dark;
  }
}
