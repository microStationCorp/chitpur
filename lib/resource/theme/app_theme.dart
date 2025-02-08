import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/theme/color_scheme.dart';
import 'package:chitpur/resource/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData _baseTheme = ThemeData(
    useMaterial3: true,
    // Use Material Design 3
    fontFamily: GoogleFonts.inconsolata().fontFamily,
    // Set default font family
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 30, // Icon size for FAB
    ),
  );

  static ThemeData lightTheme = _baseTheme.copyWith(
    textTheme: CTextTheme.lightTextTheme,
    colorScheme: CColorScheme.lightColorScheme,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    appBarTheme: AppBarTheme().copyWith(
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: AppColors.light.surface,
      elevation: 0,
      unselectedItemColor: AppColors.light.primaryFixedDim,
    ),
  );

  static ThemeData darkTheme = _baseTheme.copyWith(
    textTheme: CTextTheme.darkTextTheme,
    colorScheme: CColorScheme.darkColorScheme,
    scaffoldBackgroundColor: Color(0xFF101010),
    appBarTheme: AppBarTheme().copyWith(
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: AppColors.dark.surface,
      elevation: 0,
      unselectedItemColor: AppColors.dark.primaryFixed,
    ),
  );
}
