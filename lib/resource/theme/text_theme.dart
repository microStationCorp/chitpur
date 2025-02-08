import 'package:chitpur/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme _baseTextTheme(Color color) =>
      GoogleFonts.inconsolataTextTheme(Typography.blackCupertino).copyWith(
        displayLarge: TextStyle().copyWith(
            fontSize: 57,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
            color: color),
        displayMedium: TextStyle().copyWith(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            color: color),
        displaySmall: TextStyle().copyWith(
          fontSize: 36,
          color: color,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
        headlineLarge: TextStyle().copyWith(
            fontSize: 32,
            color: color,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.15),
        headlineMedium: TextStyle().copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: color,
        ),
        headlineSmall: TextStyle().copyWith(
            fontSize: 24,
            color: color,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1),
        titleLarge: TextStyle().copyWith(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.0),
        titleMedium: TextStyle().copyWith(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.0),
        titleSmall: TextStyle().copyWith(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1),
        bodyLarge: TextStyle().copyWith(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5),
        bodyMedium: TextStyle().copyWith(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25),
        bodySmall: TextStyle().copyWith(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4),
        labelLarge: TextStyle().copyWith(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1),
        labelMedium: TextStyle().copyWith(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5),
        labelSmall: TextStyle().copyWith(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4),
      );

  static TextTheme lightTextTheme = _baseTextTheme(AppColors.light.onSurface);
  static TextTheme darkTextTheme = _baseTextTheme(AppColors.dark.onSurface);
}
