import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_colors.g.dart';
part 'app_colors.freezed.dart';

const Color _white = Color(0xffFAFAFA);
const Color _black = Color.fromARGB(255, 28, 28, 28);

@freezed
abstract class AppColors with _$AppColors {
  const factory AppColors({
    required Color base100,
    required Color base200,
    required Color base300,
    required Color baseContent,
    required Color primary,
    required Color primaryContent,
    required Color secondary,
    required Color secondaryContent,
    required Color accent,
    required Color accentContent,
    required Color neutral,
    required Color neutralContent,
    required Color info,
    required Color infoContent,
    required Color success,
    required Color successContent,
    required Color warning,
    required Color warningContent,
    required Color error,
    required Color errorContent,
    required Color white,
    required Color black,
    required Color disabled,
    required Color disabledContent,
  }) = _AppColors;

  // 预设浅色/深色主题
  static const light = AppColors(
    base100: _white,
    base200: Color.fromARGB(228, 250, 250, 250),
    base300: Color.fromARGB(189, 250, 250, 250),
    baseContent: _black,
    primary: Color.fromARGB(255, 30, 41, 136),
    primaryContent: _white,
    secondary: Color.fromARGB(255, 123, 143, 153),
    secondaryContent: _black,
    accent: Color.fromARGB(255, 234, 105, 71),
    accentContent: _black,
    neutral: _white,
    neutralContent: _black,
    info: Color.fromARGB(255, 48, 131, 255),
    infoContent: _white,
    success: Color.fromARGB(255, 63, 219, 48),
    successContent: _white,
    warning: Color.fromARGB(255, 219, 174, 90),
    warningContent: _black,
    error: Color.fromARGB(255, 247, 25, 66),
    errorContent: _white,
    white: _white,
    black: _black,
    disabled: Color.fromARGB(255, 204, 204, 204),
    disabledContent: Color.fromARGB(255, 177, 177, 177),
  );
}

@riverpod
class AppTheme extends _$AppTheme {
  @override
  AppColors build() {
    return AppColors.light;
  }
}
