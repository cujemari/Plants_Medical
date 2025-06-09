import 'dart:io';
import 'package:app_plants/presentation/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static Future<void> cerrarSesion(
    BuildContext context, {
    bool cerrarApp = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (cerrarApp) {
      exit(0); // Cierra completamente la app
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
