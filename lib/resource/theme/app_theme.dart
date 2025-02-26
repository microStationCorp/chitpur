import 'package:chitpur/resource/theme/app_color.dart';
import 'package:chitpur/resource/theme/app_typography.dart';
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
    floatingActionButtonTheme:
        FloatingActionButtonThemeData().copyWith(elevation: 2),
    // Set default font family
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle().copyWith(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTypo.borderRadius),
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle().copyWith(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTypo.borderRadius),
          ),
        ),
      ),
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
      unselectedItemColor: AppColors.light.primaryFixed,
    ),
    bottomAppBarTheme: BottomAppBarTheme().copyWith(
      elevation: 0,
      color: AppColors.light.primaryContainer,
    ),
    iconTheme: IconThemeData(
      color: AppColors.light.onPrimaryContainer,
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
      backgroundColor: AppColors.dark.primaryContainer,
      elevation: 0,
      unselectedItemColor: AppColors.dark.primaryFixed,
    ),
    bottomAppBarTheme: BottomAppBarTheme().copyWith(
      elevation: 0,
      color: AppColors.dark.primaryContainer,
    ),
    iconTheme: IconThemeData().copyWith(
      color: AppColors.dark.onPrimaryContainer,
    ),
  );
}
