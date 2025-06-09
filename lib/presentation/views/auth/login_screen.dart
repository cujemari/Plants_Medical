import 'package:app_plants/core/services/auth_service.dart';
import 'package:app_plants/presentation/views/home/start_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _signIn(BuildContext context) async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => StartPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error al iniciar sesión')));
    }
  }

  void _continueOffline(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => StartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset("assets/logos/logo.png", height: 85),
            const SizedBox(height: 50),
            const Text(
              'PLANTAS MEDICINALES',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => _signIn(context),
              child: const Text('Iniciar con Google'),
            ),
            TextButton(
              onPressed: () => _continueOffline(context),
              child: const Text(
                'Modo Offline',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
