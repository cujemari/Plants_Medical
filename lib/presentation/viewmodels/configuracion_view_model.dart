import 'package:app_plants/data/repositories/Aut_repository_imple.dart';
import 'package:flutter/material.dart';

class ConfiguracionViewModel extends ChangeNotifier {
  void cerrarSesion(BuildContext context) {
    AutRepositoryImple.cerrarSesion(context);
  }
}
