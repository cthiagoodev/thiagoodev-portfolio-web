import 'package:dependencies/dependencies.dart';
import 'package:portfolio/modules/home/presentation/home_screen.dart';

final List<GoRoute> routes = [
  GoRoute(
    name: "Home",
    path: Routes.home,
    builder: (context, state) => const HomeScreen(),
  ),
];

abstract class Routes {
  static const String home = "/";
}