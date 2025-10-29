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

  static Color _darkTextButtonForegroundColor(Set<WidgetState> states) {
    if(states.contains(WidgetState.hovered)) {
      return AppColors.primaryLight;
    }
    return AppColors.neutral;
  }

  static Color _darkOverlayColor(Set<WidgetState> states) {
    if(states.contains(WidgetState.hovered)) {
      return AppColors.neutral.withValues(alpha: .1);
    }
    return Colors.transparent;
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
        overlayColor: WidgetStateProperty.resolveWith(_darkOverlayColor),
      ),
    )
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
