import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_plants/core/services/auth_service.dart';
import 'package:app_plants/presentation/views/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      appBar: AppBar(
        title: const Text(
          'Perfil de Usuario',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF0B918A),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user != null ? _perfilUsuario(context, user) : _perfilInvitado(),
      ),
    );
  }

  Widget _perfilUsuario(BuildContext context, User user) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (user.photoURL != null)
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              radius: 50,
            ),
          const SizedBox(height: 20),
          Text(
            user.displayName ?? 'Usuario',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(user.email ?? '', style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _perfilInvitado() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.person_outline, size: 100, color: Colors.white70),
          SizedBox(height: 20),
          Text(
            'Modo invitado',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'No has iniciado sesión.\nAlgunas funciones están limitadas.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

/**¿Qué hace esta pantalla?
Detecta si el usuario está conectado (modo online con Firebase).

Muestra su foto, nombre y correo si está logueado.

En modo invitado (offline), muestra un mensaje genérico y un ícono.

Botón para cerrar sesión (si está conectado).

🔧 Requiere:
Integración previa con Firebase y Google Sign-In.

Ruta nombrada para redirigir tras cerrar sesión (por ejemplo, al login o splash).*/
