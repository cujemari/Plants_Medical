import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileUserWidget extends StatelessWidget {
  final User user;
  final VoidCallback onLogout;

  const ProfileUserWidget({
    required this.user,
    required this.onLogout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            onPressed: onLogout,
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
}
