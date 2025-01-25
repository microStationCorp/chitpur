import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define the theme data for the application
ThemeData appTheme = ThemeData(
  useMaterial3: true,
  // Use Material Design 3
  fontFamily: GoogleFonts.inconsolata().fontFamily,
  // Set default font family
  colorScheme: ColorScheme(
    primary: AppColor.charcoalGrey,
    // Primary color
    onPrimary: AppColor.warmBeige,
    // Color on primary
    secondary: AppColor.slateGrey,
    // Secondary color
    onSecondary: AppColor.black,
    // Color on secondary
    surface: AppColor.lightGrey,
    // Surface color
    onSurface: AppColor.black,
    // Color on surface
    error: AppColor.errorSurfaceColor,
    // Error color
    onError: AppColor.errorTextColor,
    // Color on error
    brightness: Brightness.light, // Light theme
  ),
  expansionTileTheme: ExpansionTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(10), // Rounded corners for expansion tiles
    ),
  ),
  scaffoldBackgroundColor: AppColor.white,
  // Background color for scaffold
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColor.tileTextColor),
    // Body text style
    bodyMedium: TextStyle(color: AppColor.charcoalGrey),
    // Medium body text style
    headlineLarge: TextStyle(
      color: AppColor.tileTextColor, // Headline color
      fontSize: 24, // Font size for headlines
      fontWeight: FontWeight.bold, // Bold headlines
    ),
  ),
  cardTheme: CardTheme(
    color: AppColor.tileSurfaceColor, // Card background color
    surfaceTintColor: AppColor.tileTextColor, // Surface tint for cards
  ),
  listTileTheme: ListTileThemeData(
    tileColor: AppColor.tileSurfaceColor, // Tile color
    textColor: AppColor.primaryColor, // Text color for list tiles
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: AppColor.tileSurfaceColor, // Color for bottom app bar
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.slateGrey, // Button color
    textTheme: ButtonTextTheme.primary, // Text theme for buttons
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.white,
    // Background color for app bar
    iconTheme: IconThemeData(color: AppColor.charcoalGrey),
    // Icon color for app bar
    titleTextStyle: TextStyle(
      color: AppColor.primaryColor, // Title text color
      fontSize: AppTypo.appbarFontSize, // Font size for title
      fontFamily: GoogleFonts.inconsolata().fontFamily, // Font family for title
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.lightGrey, // Background color for FAB
    foregroundColor: AppColor.primaryColor, // Icon color for FAB
    iconSize: 30, // Icon size for FAB
  ),
);
