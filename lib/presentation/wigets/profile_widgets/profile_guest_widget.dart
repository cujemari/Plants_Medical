import 'package:flutter/material.dart';

class ProfileGuestWidget extends StatelessWidget {
  const ProfileGuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
