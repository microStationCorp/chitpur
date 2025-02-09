import 'package:chitpur/resource/theme/app_color.dart';
import 'package:chitpur/resource/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme _baseTextTheme(Color color) {
    final base = GoogleFonts.inconsolataTextTheme(Typography.blackCupertino);
    TextStyle style(double size,
            [FontWeight weight = FontWeight.normal, double spacing = 0]) =>
        TextStyle(
            fontSize: size,
            fontWeight: weight,
            letterSpacing: spacing,
            color: color);

    return base.copyWith(
      displayLarge: style(AppTypo.displayLarge, FontWeight.bold, 0.25),
      displayMedium: style(AppTypo.displayMedium, FontWeight.bold),
      displaySmall: style(AppTypo.displaySmall, FontWeight.w600),
      headlineLarge: style(AppTypo.headlineLarge, FontWeight.bold, 0.15),
      headlineMedium: style(AppTypo.headlineMedium, FontWeight.w600, 0.15),
      headlineSmall: style(AppTypo.headlineSmall, FontWeight.w500, 0.1),
      titleLarge: style(AppTypo.titleLarge, FontWeight.bold),
      titleMedium: style(AppTypo.titleMedium, FontWeight.w500),
      titleSmall: style(AppTypo.titleSmall, FontWeight.w500, 0.1),
      bodyLarge: style(AppTypo.bodyLarge, FontWeight.normal, 0.5),
      bodyMedium: style(AppTypo.bodyMedium, FontWeight.normal, 0.25),
      bodySmall: style(AppTypo.bodySmall, FontWeight.normal, 0.4),
      labelLarge: style(AppTypo.labelLarge, FontWeight.w600, 0.1),
      labelMedium: style(AppTypo.labelMedium, FontWeight.w500, 0.5),
      labelSmall: style(AppTypo.labelSmall, FontWeight.w400, 0.4),
    );
  }

  static final lightTextTheme = _baseTextTheme(AppColors.light.onSurface);
  static final darkTextTheme = _baseTextTheme(AppColors.dark.onSurface);
}
