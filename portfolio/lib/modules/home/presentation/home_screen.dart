import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NavigationAppBar(
        leading: _buildLeading(context),
        options: _buildOptions(context),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          title: Text('Content Item $index'),
        ),
      ),
    );
  }

  NavigationAppBarLeading _buildLeading(BuildContext context) {
    return NavigationAppBarLeading(
      onTap: () => context.go('/'),
      widget: TextButton(
        onPressed: null,
        child: Text(
          'thiagoodev',
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