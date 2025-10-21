import 'package:app/router.dart';
import 'package:app/theme.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: "Portfolio",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          routerConfig: router,
        );
      },
    );
  }
}
