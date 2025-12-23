import 'package:flutter/material.dart';

class CommonColor {
  static Color white = Color(0xffFAFAFA);
  static Color black = Color.fromARGB(255, 28, 28, 28);
  static Color disabled = Color.fromARGB(255, 204, 204, 204);
  static Color onDisabled = Color.fromARGB(255, 177, 177, 177);
  static Color success = Color.fromARGB(255, 63, 219, 48);
  static Color onSuccess = Color(0xffFAFAFA);
}

var _baseTextTheme = ThemeData.light().textTheme;

TextTheme defaultTextTheme = ThemeData.light().textTheme.copyWith(
  bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
    fontSize: 18.0,
    color: CommonColor.black,
  ),
  // 修改 headlineLarge (例如用于标题或大型文本)
  headlineLarge: _baseTextTheme.headlineLarge?.copyWith(
    fontSize: 36.0, // 设置标题文本大小为 36
    fontWeight: FontWeight.bold,
  ),
  // 其他 text styles (bodySmall, titleMedium, labelLarge, etc.) 也可以在此修改
);
