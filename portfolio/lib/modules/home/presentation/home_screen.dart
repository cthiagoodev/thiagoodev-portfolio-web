import 'package:common/common.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:dependencies/dependencies.dart';
import 'package:portfolio/modules/home/presentation/widgets/background_gradient_effect.dart';
import 'package:portfolio/modules/home/presentation/widgets/hero.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceColor = theme.colorScheme.surface;

    final List<Widget> mainSections = [
      Hero(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: surfaceColor,
      appBar: NavigationAppBar(
        leading: _buildLeading(context),
        options: _buildOptions(context),
      ),
      body: BackgroundGradientEffect(
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: mainSections.map((section) {
                return SizedBox(
                  height: 1.sh - navigationAppBarHeight,
                  child: section,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.go("/"),
      child: Text(
        'thiagoodev',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  List<NavigationAppBarOption> _buildOptions(BuildContext context) {
    void scrollToSection(String sectionId) {

    }
    return [
      NavigationAppBarOption(
          label: 'Início', onTap: () => scrollToSection('#inicio')),
      NavigationAppBarOption(
          label: 'Carreira', onTap: () => scrollToSection('#carreira')),
      NavigationAppBarOption(
          label: 'Portfólio', onTap: () => scrollToSection('#portfolio')),
      NavigationAppBarOption(
          label: 'Sobre', onTap: () => scrollToSection('#sobre')),
      NavigationAppBarOption(
          label: 'Contato', onTap: () => scrollToSection('#contato')),
    ];
  }
}