import 'package:flutter/material.dart';

class ThemeColor {
  static Color main = const Color(0xFF070707);
  static Color accent = const Color(0xFFD43728);
  static Color accent2 = const Color(0xFF3b2231);
  static Color idle = const Color(0xFF817D8F);
  static Color idle2 = const Color(0xFF9C9A9A);
  static Color idle3 = const Color(0xFF5A5555);
  static Color secondary = const Color(0xFFF9CAB9);
  static Color secondary2 = const Color(0xFFFAF8F6);

  static MaterialColor swatch = MaterialColor(0xFF070707, {
    50: secondary2,
    100: secondary,
    200: accent,
    300: idle2,
    400: idle,
    500: idle3,
    600: accent2,
    700: main,
  });
}
