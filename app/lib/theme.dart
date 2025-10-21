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

abstract class AppRadius {
  static final double medium = 16.r;
  static final double large = 32.r;
  static final double small = 8.r;
}

abstract class AppPadding {
  static final EdgeInsets button = EdgeInsets.symmetric(
    horizontal: 24.w,
    vertical: 16.h,
  );
  static final EdgeInsets navigationLink = EdgeInsets.all(12.sp);
}

class AppTheme {
  static final TextTheme _baseTextTheme =
      GoogleFonts.plusJakartaSansTextTheme();

  static final TextStyle _buttonTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle _navigationLinkTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static final OutlinedBorder _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.large),
  );

  static final OutlinedBorder _navigationLinkShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.small),
  );

  static double _resolveButtonElevation(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return 8.0;
    }
    if (states.contains(WidgetState.pressed)) {
      return 2.0;
    }
    return 0.0;
  }

  static Color _resolveDarkElevatedShadowColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.primaryLight.withAlpha(77);
    }
    return Colors.transparent;
  }

  static Color _resolveDarkOutlinedForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.background;
    }
    return AppColors.neutral;
  }

  static Color _resolveDarkOutlinedBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.neutral;
    }
    return Colors.transparent;
  }

  static Color _resolveDarkNavigationForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.primaryLight;
    }
    return AppColors.neutral;
  }

  static Color _resolveDarkNavigationOverlayColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return Colors.white.withAlpha(51);
    }
    return Colors.transparent;
  }

  static Color _resolveLightElevatedShadowColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.primary.withAlpha(77);
    }
    return Colors.transparent;
  }

  static Color _resolveLightOutlinedForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.foreground;
    }
    return AppColors.primaryDark;
  }

  static Color _resolveLightOutlinedBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.primaryDark;
    }
    return Colors.transparent;
  }

  static Color _resolveLightNavigationForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.primary;
    }
    return AppColors.primaryDark;
  }

  static Color _resolveLightNavigationOverlayColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.primary.withAlpha(26);
    }
    return Colors.transparent;
  }

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: _baseTextTheme.apply(
      bodyColor: AppColors.foreground,
      displayColor: AppColors.foreground,
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      surface: AppColors.background,
      onSurface: AppColors.foreground,
      primary: AppColors.primary,
      onPrimary: AppColors.foreground,
      secondary: AppColors.accent,
      onSecondary: AppColors.background,
      tertiary: AppColors.primaryLight,
      onTertiary: AppColors.primaryDark,
      outline: AppColors.neutral,
      error: Color(0xFFCF6679),
      onError: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryLight),
        foregroundColor: WidgetStateProperty.all(AppColors.primaryDark),
        padding: WidgetStateProperty.all(AppPadding.button),
        shape: WidgetStateProperty.all(_buttonShape),
        textStyle: WidgetStateProperty.all(_buttonTextStyle),
        elevation: WidgetStateProperty.resolveWith(_resolveButtonElevation),
        shadowColor: WidgetStateProperty.resolveWith(
          _resolveDarkElevatedShadowColor,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(_buttonTextStyle),
        padding: WidgetStateProperty.all(AppPadding.button),
        shape: WidgetStateProperty.all(_buttonShape),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.neutral),
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          _resolveDarkOutlinedForegroundColor,
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          _resolveDarkOutlinedBackgroundColor,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(_navigationLinkTextStyle),
        padding: WidgetStateProperty.all(AppPadding.navigationLink),
        shape: WidgetStateProperty.all(_navigationLinkShape),
        foregroundColor: WidgetStateProperty.resolveWith(
          _resolveDarkNavigationForegroundColor,
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          _resolveDarkNavigationOverlayColor,
        ),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(AppColors.foreground),
        padding: WidgetStateProperty.all(AppPadding.button),
        shape: WidgetStateProperty.all(_buttonShape),
        textStyle: WidgetStateProperty.all(_buttonTextStyle),
        elevation: WidgetStateProperty.resolveWith(_resolveButtonElevation),
        shadowColor: WidgetStateProperty.resolveWith(
          _resolveLightElevatedShadowColor,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(_buttonTextStyle),
        padding: WidgetStateProperty.all(AppPadding.button),
        shape: WidgetStateProperty.all(_buttonShape),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.primaryDark),
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          _resolveLightOutlinedForegroundColor,
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          _resolveLightOutlinedBackgroundColor,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(_navigationLinkTextStyle),
        padding: WidgetStateProperty.all(AppPadding.navigationLink),
        shape: WidgetStateProperty.all(_navigationLinkShape),
        foregroundColor: WidgetStateProperty.resolveWith(
          _resolveLightNavigationForegroundColor,
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          _resolveLightNavigationOverlayColor,
        ),
      ),
    ),
  );
}
