import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoBlocAppTheme {
  static final lightTheme = FlexThemeData.light(
    useMaterial3: true,
    colors: _flexScheme.light,
    visualDensity: VisualDensity.standard,
    fontFamily: 'Montserrat',
    typography: Typography.material2021(platform: defaultTargetPlatform),
  );

  static final darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    colors: _flexScheme.dark,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.standard,
    typography: Typography.material2021(platform: defaultTargetPlatform),
  );

  // ignore: unused_field
  static const FlexSchemeData _flexScheme = FlexSchemeData(
    name: 'Midnight blue',
    description: 'Midnight blue theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Color(0xFFE8A0BF),
      primaryContainer: Color(0xFFE56CA0),
      secondary: Color(0xFFBA90C6),
      secondaryContainer: Color(0xFFAF60C6),
      tertiary: Color(0xFFC0DBEA),
      tertiaryContainer: Color(0xFF87C5E8),
    ),
    dark: FlexSchemeColor(
      primary: Color(0xFF150050),
      primaryContainer: Color(0xFF3400C5),
      secondary: Color(0xFF6F00C8),
      secondaryContainer: Color(0xFF3F0071),
      tertiary: Color(0xFFFB2576),
      tertiaryContainer: Color(0xFFFF73A8),
    ),
  );
}
