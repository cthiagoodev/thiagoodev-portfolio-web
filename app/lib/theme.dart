import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color background = Color(0xFF000000);
  static const Color foreground = Color(0xFFF9FAFA);
  static const Color primary = Color(0xFF5842C3);
  static const Color primaryDark = Color(0xFF251E40);
  static const Color primaryLight = Color(0xFFE3B0FF);
  static const Color neutral = Color(0xFFBDBDBD);
  static const Color accent = Color(0xFF00D9FF);
}

class AppTheme {
  static final TextTheme _baseTextTheme = GoogleFonts.plusJakartaSansTextTheme();

  static final TextStyle _darkTextButtonTheme =
    _baseTextTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700);

  static final TextStyle _darkButtonTheme =
    _baseTextTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700);

  static Color _darkTextButtonForegroundColor(Set<WidgetState> states) {
    if(states.contains(WidgetState.hovered)) {
      return AppColors.primaryLight;
    }
    return AppColors.neutral;
  }

  static double _darkElevatedButtonElevation(Set<WidgetState> states) {
    return states.contains(WidgetState.hovered) ? 5 : 0;
  }

  static Color? _darkElevatedButtonShadowColor(Set<WidgetState> states) {
    return states.contains(WidgetState.hovered)
        ? AppColors.primaryLight.withValues(alpha: .5)
        : null;
  }

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: _baseTextTheme.apply(
      bodyColor: AppColors.neutral,
      displayColor: AppColors.neutral,
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      surface: AppColors.background,
      onSurface: AppColors.foreground,
      primary: AppColors.primary,
      onPrimary: AppColors.foreground,
      secondary: AppColors.primaryDark,
      onSecondary: AppColors.background,
      tertiary: AppColors.primaryLight,
      onTertiary: AppColors.accent,
      outline: AppColors.neutral,
      error: Color(0xFFCF6679),
      onError: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
        textStyle: WidgetStatePropertyAll(_darkTextButtonTheme),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        ),
        foregroundColor: WidgetStateProperty.resolveWith(_darkTextButtonForegroundColor),
        overlayColor: WidgetStatePropertyAll(AppColors.neutral.withValues(alpha: .1)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        padding: WidgetStatePropertyAll(EdgeInsets.all(25)),
        iconAlignment: IconAlignment.start,
        iconColor: WidgetStatePropertyAll(Colors.black),
        iconSize: WidgetStatePropertyAll(18),
        textStyle: WidgetStatePropertyAll(_darkButtonTheme),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
        overlayColor: WidgetStatePropertyAll(AppColors.primary.withValues(alpha: .1)),
        visualDensity: VisualDensity.compact,
        elevation: WidgetStateProperty.resolveWith(_darkElevatedButtonElevation),
        shadowColor: WidgetStateProperty.resolveWith(_darkElevatedButtonShadowColor)
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        padding: WidgetStatePropertyAll(EdgeInsets.all(25)),
        iconAlignment: IconAlignment.start,
        iconColor: WidgetStatePropertyAll(AppColors.neutral),
        iconSize: WidgetStatePropertyAll(18),
        textStyle: WidgetStatePropertyAll(_darkButtonTheme),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)),
        ),
        side: WidgetStatePropertyAll(BorderSide(
          color: AppColors.neutral,
        )),
        foregroundColor: WidgetStatePropertyAll(AppColors.neutral),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        visualDensity: VisualDensity.compact,
        elevation: WidgetStatePropertyAll(0),
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.foreground,
    textTheme: _baseTextTheme.apply(
      bodyColor: AppColors.background,
      displayColor: AppColors.background,
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      surface: AppColors.foreground,
      onSurface: AppColors.background,
      primary: AppColors.primary,
      onPrimary: AppColors.foreground,
      secondary: AppColors.accent,
      onSecondary: AppColors.background,
      tertiary: AppColors.primaryDark,
      onTertiary: AppColors.foreground,
      outline: AppColors.neutral,
      error: Color(0xFFB00020),
      onError: Colors.white,
    ),
  );
}
