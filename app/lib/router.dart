import 'package:dependencies/dependencies.dart';
import 'package:portfolio/portfolio.dart' as portfolio;

final GoRouter router = GoRouter(
  initialLocation: portfolio.Routes.home,
  routes: [
    ...portfolio.routes,
  ],
);