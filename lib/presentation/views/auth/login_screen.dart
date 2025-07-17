import 'package:flutter/material.dart';
import 'package:app_plants/core/services/auth_service.dart';
import 'package:app_plants/presentation/views/home/start_page_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _signIn(BuildContext context) async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const StartPageScreen()),
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
      MaterialPageRoute(builder: (_) => const StartPageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/logos/fondo_login.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        "assets/logos/logo.png",
                        height: isLandscape ? 80 : 100,
                      ),
                      const SizedBox(height: 26),
                      const Text(
                        'PLANTAS MEDICINALES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontFamily: "Georgia",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: size.height * 0.4),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton.icon(
                          onPressed: () => _signIn(context),
                          icon: const Icon(Icons.login, color: Colors.black),
                          label: const Text(
                            'Iniciar con Google',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton.icon(
                        onPressed: () => _continueOffline(context),
                        icon: const Icon(Icons.wifi_off, color: Colors.white),
                        label: const Text(
                          'Modo Offline',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
