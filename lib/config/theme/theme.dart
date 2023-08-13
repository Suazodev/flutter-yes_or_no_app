import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF00FF00);

const List<Color> colorThemes = [
  Colors.blueGrey,
  Colors.teal,
  _customColor,
];

class CustomTheme {
  final int selectedColor;
  final bool isDark;

  CustomTheme({this.selectedColor = 0, this.isDark = true});

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
