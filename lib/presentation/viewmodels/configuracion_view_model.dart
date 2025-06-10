import 'package:app_plants/data/repositories/Aut_repository_imple.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ConfiguracionViewModel extends ChangeNotifier {
  void compartirApp() {
    Share.share("¡Descubre esta app de plantas medicinales!");
  }

  void cerrarSesion(BuildContext context) {
    AutRepositoryImple.cerrarSesion(context);
  }
}
