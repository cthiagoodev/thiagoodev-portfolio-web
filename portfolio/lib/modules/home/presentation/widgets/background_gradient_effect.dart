import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

final class BackgroundGradientEffect extends StatelessWidget {
  final Widget child;
  const BackgroundGradientEffect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceColor = colorScheme.surface;
    final primaryColor = colorScheme.primary;
    final secondaryColor = colorScheme.secondary;
    return AnimateGradient(
      primaryColors: [
        surfaceColor,
        secondaryColor,
        primaryColor,
      ],
      secondaryColors: [
        secondaryColor,
        primaryColor,
        surfaceColor,
      ],
      primaryBegin: Alignment.topCenter,
      primaryEnd: Alignment.bottomCenter,
      animateAlignments: false,
      duration: const Duration(seconds: 18),
      child: child,
    );
  }
}
