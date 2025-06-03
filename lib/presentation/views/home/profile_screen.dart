import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        backgroundColor: const Color(0xFF0B918A),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _perfilInvitado(),
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
