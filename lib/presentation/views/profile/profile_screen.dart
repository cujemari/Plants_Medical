import 'package:app_plants/presentation/viewmodels/profile_view_model.dart';
import 'package:app_plants/presentation/wigets/profile_widgets/profile_guest_widget.dart';
import 'package:app_plants/presentation/wigets/profile_widgets/profile_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = ProfileViewModel();
        viewModel.loadUser();
        return viewModel;
      },
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          final user = viewModel.user;

          return Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
              title: const Text(
                'Perfil de Usuario',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.green,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: user != null
                  ? ProfileUserWidget(
                      user: user,
                      onLogout: () => viewModel.logout(context, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      }),
                    )
                  : const ProfileGuestWidget(),
            ),
          );
        },
      ),
    );
  }
}

/**¿Qué hace esta pantalla?
Detecta si el usuario está conectado (modo online con Firebase).

Muestra su foto, nombre y correo si está logueado.

En modo invitado (offline), muestra un mensaje genérico y un ícono.

Botón para cerrar sesión (si está conectado).

Requiere:
Integración previa con Firebase y Google Sign-In.

Ruta nombrada para redirigir tras cerrar sesión (por ejemplo, al login o splash).*/
