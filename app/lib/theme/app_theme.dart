// Theme tokens mirrored from the website's src/styles/tokens.css and base.css.
// Font: the site's --font-sans is the system UI stack (-apple-system, Segoe UI,
// sans-serif), so no Google font is bundled; Flutter's platform default is used.
// --font-mono (JetBrains Mono) is not mapped: it would need a bundled font asset.

import 'package:flutter/material.dart';

/// Colour tokens from tokens.css (`--color-*`).
class AppColors {
  AppColors._();

  /// --color-text: #1A1A1A
  static const Color colorText = Color(0xFF1A1A1A);

  /// --color-surface: #FFFFFF
  static const Color colorSurface = Color(0xFFFFFFFF);

  /// --color-surface-muted: #F5F5F5
  static const Color colorSurfaceMuted = Color(0xFFF5F5F5);

  /// --color-border: #D4D4D4
  static const Color colorBorder = Color(0xFFD4D4D4);

  /// --color-text-secondary: #5C5C5C
  static const Color colorTextSecondary = Color(0xFF5C5C5C);

  /// --color-accent: #2F4A6D
  static const Color colorAccent = Color(0xFF2F4A6D);

  /// --color-focus: var(--color-accent)
  static const Color colorFocus = colorAccent;

  /// Shadow from --shadow-card: rgba(0, 0, 0, 0.08).
  /// 0.08 * 255 = 20.4, rounded to alpha 0x14 (20); this is the closest 8-bit value.
  static const Color shadowCard = Color(0x14000000);
}

/// Radius values from tokens.css (`--radius`).
class AppRadius {
  AppRadius._();

  /// --radius: 8px
  static const double radius = 8;

  /// Pre-built BorderRadius for `--radius`.
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(radius));
}

/// Spacing values from tokens.css (`--space-*`, `--gutter`, `--container`).
class AppSpacing {
  AppSpacing._();

  /// --space-1: 8px
  static const double space1 = 8;

  /// --space-2: 16px
  static const double space2 = 16;

  /// --space-3: 24px
  static const double space3 = 24;

  /// --space-4: 32px
  static const double space4 = 32;

  /// --space-6: 48px
  static const double space6 = 48;

  /// --space-8: 64px
  static const double space8 = 64;

  /// --gutter: 1.5rem (24px)
  static const double gutter = 24;

  /// --container: 1280px
  static const double container = 1280;
}

/// Builds the app's Material 3 theme from the site's tokens and base styles.
ThemeData buildAppTheme() {
  final ColorScheme scheme = ColorScheme.light(
    primary: AppColors.colorAccent,
    onPrimary: AppColors.colorSurface,
    secondary: AppColors.colorAccent,
    onSecondary: AppColors.colorSurface,
    surface: AppColors.colorSurface,
    onSurface: AppColors.colorText,
    onSurfaceVariant: AppColors.colorTextSecondary,
    outline: AppColors.colorBorder,
  );

  // base.css: body colour/line-height 1.6, h1 36px/700/1.15, h2 24px/700.
  final TextTheme text = Typography.material2021()
      .black
      .apply(
        bodyColor: AppColors.colorText,
        displayColor: AppColors.colorText,
      );

  final TextTheme textTheme = text.copyWith(
    headlineLarge: text.headlineLarge?.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.15,
    ),
    headlineMedium: text.headlineMedium?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.6,
    ),
    bodyLarge: text.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
    bodyMedium: text.bodyMedium?.copyWith(fontSize: 16, height: 1.6),
  );

  final RoundedRectangleBorder roundedShape = RoundedRectangleBorder(
    borderRadius: AppRadius.borderRadius,
  );

  final ThemeData base = ThemeData(useMaterial3: true, colorScheme: scheme);

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.colorSurface,
    dividerColor: AppColors.colorBorder,
    textTheme: textTheme,

    // Cards: white surface, --shadow-card approximated by elevation + shadowColor.
    cardTheme: CardThemeData(
      color: AppColors.colorSurface,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.shadowCard,
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: roundedShape,
    ),

    // Buttons: accent fill / accent text, --radius corners.
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.colorAccent,
        foregroundColor: AppColors.colorSurface,
        shape: roundedShape,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space3,
          vertical: AppSpacing.space2,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.colorAccent,
        side: const BorderSide(color: AppColors.colorBorder),
        shape: roundedShape,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space3,
          vertical: AppSpacing.space2,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.colorAccent,
        shape: roundedShape,
      ),
    ),

    // Chips: muted surface, border, --radius corners.
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: AppColors.colorSurfaceMuted,
      selectedColor: AppColors.colorAccent,
      side: const BorderSide(color: AppColors.colorBorder),
      shape: roundedShape,
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.colorText,
      ),
    ),

    // Inputs: muted fill, border, 2px accent focus ring (base.css :focus-visible).
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.colorSurfaceMuted,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space2,
        vertical: AppSpacing.space2,
      ),
      labelStyle: const TextStyle(color: AppColors.colorTextSecondary),
      hintStyle: const TextStyle(color: AppColors.colorTextSecondary),
      border: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadius,
        borderSide: BorderSide(color: AppColors.colorBorder),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadius,
        borderSide: BorderSide(color: AppColors.colorBorder),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadius,
        borderSide: BorderSide(color: AppColors.colorFocus, width: 2),
      ),
    ),
  );
}
