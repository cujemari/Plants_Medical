import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileUserWidget extends StatelessWidget {
  final User user;
  final VoidCallback onLogout;

  const ProfileUserWidget({
    super.key,
    required this.user,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar cierre de sesión'),
        content: const Text('¿Deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onLogout();
            },
            child: const Text('Sí', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
