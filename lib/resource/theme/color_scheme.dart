import 'package:flutter/material.dart';

import 'app_color.dart';

class CColorScheme {
  CColorScheme._();

  static ColorScheme darkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    // Since #101010 is the primary color, dark mode is preferred
    primary: AppColors.dark.primary,
    // Main dark color
    onPrimary: AppColors.dark.onPrimary,
    // Text/Icon color on primary background
    primaryContainer: AppColors.dark.primaryContainer,
    onPrimaryContainer: AppColors.dark.onPrimaryContainer,
    primaryFixed: AppColors.dark.primaryFixed,
    onPrimaryFixed: AppColors.dark.onPrimaryFixed,
    primaryFixedDim: AppColors.dark.primaryFixedDim,
    onPrimaryFixedVariant: AppColors.dark.onPrimaryFixedVariant,

    secondary: AppColors.dark.secondary,
    // Nude beige tone for highlights
    onSecondary: AppColors.dark.onSecondary,
    // Text/Icon color on background
    secondaryContainer: AppColors.dark.secondaryContainer,
    onSecondaryContainer: AppColors.dark.onSecondaryContainer,
    secondaryFixed: AppColors.dark.secondaryFixed,
    onSecondaryFixed: AppColors.dark.onSecondaryFixed,
    secondaryFixedDim: AppColors.dark.secondaryFixedDim,
    onSecondaryFixedVariant: AppColors.dark.onSecondaryFixedVariant,

    surface: AppColors.dark.surface,
    // Cards, dialogs, app bars
    onSurface: AppColors.dark.onSurface,
    // Text/Icon color on surface
    surfaceDim: AppColors.dark.surfaceDim,
    surfaceBright: AppColors.dark.surfaceBright,
    surfaceContainerLowest: AppColors.dark.surfaceContainerLowest,
    surfaceContainerLow: AppColors.dark.surfaceContainerLow,
    surfaceContainer: AppColors.dark.surfaceContainer,
    surfaceContainerHigh: AppColors.dark.surfaceContainerHigh,
    surfaceContainerHighest: AppColors.dark.surfaceContainerHighest,
    onSurfaceVariant: AppColors.dark.onSurfaceVariant,

    error: AppColors.dark.error,
    // Muted coral red for error messages
    onError: AppColors.dark.onError,
    // Text/Icon color on error
    errorContainer: AppColors.dark.errorContainer,
    onErrorContainer: AppColors.dark.onErrorContainer,

    tertiary: AppColors.dark.tertiary,
    // Another nude tone for accent
    onTertiary: AppColors.dark.onTertiary,
    // Text/Icon color on tertiary
    tertiaryContainer: AppColors.dark.tertiaryContainer,
    onTertiaryContainer: AppColors.dark.onTertiaryContainer,
    tertiaryFixed: AppColors.dark.tertiaryFixed,
    onTertiaryFixed: AppColors.dark.onTertiaryFixed,
    tertiaryFixedDim: AppColors.dark.tertiaryFixedDim,
    onTertiaryFixedVariant: AppColors.dark.onTertiaryFixedVariant,

    outline: AppColors.dark.outline,
    outlineVariant: AppColors.dark.outlineVariant,
    shadow: AppColors.dark.shadow,
    scrim: AppColors.dark.scrim,
    inverseSurface: AppColors.dark.inverseSurface,
    onInverseSurface: AppColors.dark.onInverseSurface,
    inversePrimary: AppColors.dark.inversePrimary,
    surfaceTint: AppColors.dark.surfaceTint,
  );

  static ColorScheme lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    // Since #101010 is the primary color, dark mode is preferred
    primary: AppColors.light.primary,
    // Main dark color
    onPrimary: AppColors.light.onPrimary,
    // Text/Icon color on primary background
    primaryContainer: AppColors.light.primaryContainer,
    onPrimaryContainer: AppColors.light.onPrimaryContainer,
    primaryFixed: AppColors.light.primaryFixed,
    onPrimaryFixed: AppColors.light.onPrimaryFixed,
    primaryFixedDim: AppColors.light.primaryFixedDim,
    onPrimaryFixedVariant: AppColors.light.onPrimaryFixedVariant,

    secondary: AppColors.light.secondary,
    // Nude beige tone for highlights
    onSecondary: AppColors.light.onSecondary,
    // Text/Icon color on background
    secondaryContainer: AppColors.light.secondaryContainer,
    onSecondaryContainer: AppColors.light.onSecondaryContainer,
    secondaryFixed: AppColors.light.secondaryFixed,
    onSecondaryFixed: AppColors.light.onSecondaryFixed,
    secondaryFixedDim: AppColors.light.secondaryFixedDim,
    onSecondaryFixedVariant: AppColors.light.onSecondaryFixedVariant,

    surface: AppColors.light.surface,
    // Cards, dialogs, app bars
    onSurface: AppColors.light.onSurface,
    // Text/Icon color on surface
    surfaceDim: AppColors.light.surfaceDim,
    surfaceBright: AppColors.light.surfaceBright,
    surfaceContainerLowest: AppColors.light.surfaceContainerLowest,
    surfaceContainerLow: AppColors.light.surfaceContainerLow,
    surfaceContainer: AppColors.light.surfaceContainer,
    surfaceContainerHigh: AppColors.light.surfaceContainerHigh,
    surfaceContainerHighest: AppColors.light.surfaceContainerHighest,
    onSurfaceVariant: AppColors.light.onSurfaceVariant,

    error: AppColors.light.error,
    // Muted coral red for error messages
    onError: AppColors.light.onError,
    // Text/Icon color on error
    errorContainer: AppColors.light.errorContainer,
    onErrorContainer: AppColors.light.onErrorContainer,

    tertiary: AppColors.light.tertiary,
    // Another nude tone for accent
    onTertiary: AppColors.light.onTertiary,
    // Text/Icon color on tertiary
    tertiaryContainer: AppColors.light.tertiaryContainer,
    onTertiaryContainer: AppColors.light.onTertiaryContainer,
    tertiaryFixed: AppColors.light.tertiaryFixed,
    onTertiaryFixed: AppColors.light.onTertiaryFixed,
    tertiaryFixedDim: AppColors.light.tertiaryFixedDim,
    onTertiaryFixedVariant: AppColors.light.onTertiaryFixedVariant,

    outline: AppColors.light.outline,
    outlineVariant: AppColors.light.outlineVariant,
    shadow: AppColors.light.shadow,
    scrim: AppColors.light.scrim,
    inverseSurface: AppColors.light.inverseSurface,
    onInverseSurface: AppColors.light.onInverseSurface,
    inversePrimary: AppColors.light.inversePrimary,
    surfaceTint: AppColors.light.surfaceTint,
  );
}
