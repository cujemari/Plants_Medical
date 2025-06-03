import 'package:flutter/material.dart';
import 'dart:io'; // Para exit(0)
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static Future<void> cerrarSesion(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Limpia todos los datos guardados

    exit(0); // Cierra completamente la app
  }
}
