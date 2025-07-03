import 'package:flutter/material.dart';
import 'package:app_plants/presentation/views/auth/login_screen.dart';
import 'package:app_plants/presentation/views/home/start_page_screen.dart';
import 'package:app_plants/presentation/views/splash/splash_screen.dart';
import 'package:app_plants/presentation/views/details/plant/detail_medicinal_plant.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String detailPlant = '/detallePlanta';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');

    switch (uri.path) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const StartPageScreen());

      case detailPlant:
        if (settings.arguments != null && settings.arguments is int) {
          final plantId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (_) => DetailsMedicinalPlants(plantaId: plantId),
          );
        }

        final idFromQuery = uri.queryParameters['id'];
        final plantId = int.tryParse(idFromQuery ?? '');

        if (plantId != null) {
          return MaterialPageRoute(
            builder: (_) => DetailsMedicinalPlants(plantaId: plantId),
          );
        }

        return _errorRoute('ID de planta no válido');

      default:
        return _errorRoute('Ruta no encontrada');
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Center(child: Text(message))),
    );
  }
}
