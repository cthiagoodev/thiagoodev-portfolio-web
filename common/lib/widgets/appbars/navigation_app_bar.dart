import 'dart:ui' as ui;
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

final class NavigationAppBarOption {
  final String label;
  final VoidCallback onTap;

  const NavigationAppBarOption({
    required this.label,
    required this.onTap,
  });
}

final class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final List<NavigationAppBarOption> options;

  static final double _scrolledHeight = kToolbarHeight + 15.h;

  const NavigationAppBar({
    this.leading = const SizedBox.shrink(),
    this.options = const [],
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(_scrolledHeight);

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context)
        .colorScheme
        .surface
        .withValues(alpha: .5);

    return SafeArea(
      bottom: false,
      child: Container(
        width: 1.sw,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: _buildMainRow(context),
      ),
    );
  }

  Widget _buildMainRow(BuildContext context) {
    return Row(
      spacing: 50.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leading,
        _buildOptionsWidget(context),
      ],
    );
  }

  Widget _buildOptionsWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: options.map((option) {
        return TextButton(
          onPressed: option.onTap,
          child: Text(option.label),
        );
      }).toList(),
    );
  }
}