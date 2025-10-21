import 'dart:ui' as ui;
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class NavigationAppBarLeading {
  final Widget widget;
  final VoidCallback? onTap;

  const NavigationAppBarLeading({
    required this.widget,
    this.onTap,
  });
}

class NavigationAppBarOption {
  final String label;
  final VoidCallback onTap;

  const NavigationAppBarOption({
    required this.label,
    required this.onTap,
  });
}

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NavigationAppBarLeading? leading;
  final List<NavigationAppBarOption> options;

  static final double _scrolledHeight = kToolbarHeight + 8.0.h;
  static final double _verticalPadding = 4.h;
  static const double _blurSigma = 10.0;

  const NavigationAppBar({
    this.leading,
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
        .withAlpha(51);

    return ClipRect(
      child: _buildBackdropFilter(
        child: _buildBackgroundContainer(
          color: backgroundColor,
          child: _buildSafeArea(
            child: _buildCenteringContainer(
              child: _buildHorizontalPadding(
                child: _buildMainRow(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackdropFilter({required Widget child}) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
      child: child,
    );
  }

  Widget _buildBackgroundContainer({required Color color, required Widget child}) {
    return Container(
      height: preferredSize.height,
      color: color,
      child: child,
    );
  }

  Widget _buildSafeArea({required Widget child}) {
    return SafeArea(
      bottom: false,
      child: child,
    );
  }

  Widget _buildCenteringContainer({required Widget child}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      constraints: BoxConstraints(maxWidth: 1024.w),
      child: child,
    );
  }

  Widget _buildHorizontalPadding({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: child,
    );
  }

  Widget _buildMainRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLeadingWidget(context),
        _buildOptionsWidget(context),
      ],
    );
  }


  Widget _buildLeadingWidget(BuildContext context) {
    if (leading == null) {
      return const SizedBox.shrink();
    }

    if (leading!.onTap == null) {
      return leading!.widget;
    }

    return GestureDetector(
      onTap: leading!.onTap,
      child: leading!.widget,
    );
  }

  Widget _buildOptionsWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: options.map((option) {
        bool isFirst = options.first == option;
        return Padding(
          padding: EdgeInsets.only(left: isFirst ? 0 : 8.w),
          child: TextButton(
            onPressed: option.onTap,
            child: Text(option.label),
          ),
        );
      }).toList(),
    );
  }
}