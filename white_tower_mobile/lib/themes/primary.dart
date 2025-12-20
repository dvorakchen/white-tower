import 'package:flutter/material.dart';
import 'package:white_tower_mobile/themes/common.dart';

const Color primary = Color.fromARGB(255, 30, 41, 136); // 活泼的橙色
const Color onPrimaryWhite = white; // Primary 上的文字为白色

const Color secondary = Color(0xff5EA600);
const Color onSsecondary = white;

const Color tertiary = Color.fromARGB(255, 48, 131, 255); // 第三色，通常用于强调或平衡
const Color onTertiary = white;

const Color surfaceWhite = white; // Surface (背景) 为白色
const Color onSurfaceBlack = black; // Surface 上的文字为黑色

const Color errorRed = Color.fromARGB(255, 240, 21, 61); // 错误色为红色
const Color onErrorWhite = white; // Error 上的文字为白色

var primaryColorScheme = ColorScheme(
  // 必需字段：指定主题亮度
  brightness: Brightness.light,

  // --- 核心颜色 ---
  primary: primary,
  onPrimary: onPrimaryWhite,
  primaryContainer: Color.lerp(primary, Colors.white, 0.7),
  onPrimaryContainer: primary,

  secondary: secondary, // 您指定的 secondary 背景色
  onSecondary: onSsecondary, // 您指定的 secondary 前景色
  secondaryContainer: Color.lerp(secondary, Colors.white, 0.7), // 次要容器色，设为略灰的白色
  onSecondaryContainer: secondary,

  tertiary: tertiary, // 第三色，通常用于强调或平衡
  onTertiary: onTertiary,
  tertiaryContainer: Color.lerp(tertiary, Colors.white, 0.7),
  onTertiaryContainer: tertiary,

  error: errorRed,
  onError: onErrorWhite,
  errorContainer: Color.lerp(errorRed, Colors.white, 0.7),
  onErrorContainer: errorRed,

  surface: surfaceWhite, // 您指定的 surface 背景色
  onSurface: onSurfaceBlack, // 您指定的 surface 前景色
  onSurfaceVariant: Color(0xff7d7d7d),

  outline: Color.fromARGB(255, 182, 182, 182), // 边框色
  // outlineVariant: Color.fromARGB(255, 156, 156, 156),

  // // --- 其他特殊颜色 (为保持主题完整性而设置) ---
  // shadow: Colors.black,
  // scrim: Colors.black,
  // inverseSurface: Color(0xFF333333), // 反转表面色（深色）
  // onInverseSurface: white,
  // inversePrimary: Color(0xFFFFB786),
  // surfaceTint: Color.fromARGB(255, 247, 124, 1),
);
