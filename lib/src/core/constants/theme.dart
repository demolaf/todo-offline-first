import 'dart:ui';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class TodoBlocAppTheme {
  // ignore: unused_field
  static const FlexSchemeData _myFlexScheme = FlexSchemeData(
    name: 'Midnight blue',
    description: 'Midnight blue theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Color(0xFF00296B),
      primaryContainer: Color(0xFFA0C2ED),
      secondary: Color(0xFFD26900),
      secondaryContainer: Color(0xFFFFD270),
      tertiary: Color(0xFF5C5C95),
      tertiaryContainer: Color(0xFFC8DBF8),
    ),
    dark: FlexSchemeColor(
      primary: Color(0xFFB1CFF5),
      primaryContainer: Color(0xFF3873BA),
      secondary: Color(0xFFFFD270),
      secondaryContainer: Color(0xFFD26900),
      tertiary: Color(0xFFC9CBFC),
      tertiaryContainer: Color(0xFF535393),
    ),
  );
}
