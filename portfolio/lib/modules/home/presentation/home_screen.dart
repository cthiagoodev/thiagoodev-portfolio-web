import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;
    final surfaceColor = theme.colorScheme.surface;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: surfaceColor,
      appBar: NavigationAppBar(
        leading: _buildLeading(context),
        options: _buildOptions(context),
      ),
      body: AnimateGradient(
        primaryColors: [
          surfaceColor,
          primaryColor,
          surfaceColor,
        ],
        secondaryColors: [
          secondaryColor,
          surfaceColor,
          secondaryColor,
        ],
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomRight,
        secondaryBegin: Alignment.bottomRight,
        secondaryEnd: Alignment.topLeft,
        duration: const Duration(seconds: 10),
        child: Container(),
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