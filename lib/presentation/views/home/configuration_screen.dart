import 'package:app_plants/data/repositories/log%20out_repository_imple.dart';
import 'package:app_plants/presentation/views/detalle/setting/credit_screen.dart';
import 'package:app_plants/presentation/views/detalle/setting/term_condition_screen.dart';
import 'package:app_plants/presentation/views/detalle/setting/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';

class ConfiguracionScreen extends StatefulWidget {
  const ConfiguracionScreen({super.key});

  @override
  State<ConfiguracionScreen> createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xFF0B918A),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen de configuración
              Image.asset('assets/logos/config.png'),
              const SizedBox(height: 20),

              // Switch de modo oscuro
              SwitchListTile(
                title: const Text('Modo oscuro'),
                value: context.watch<ThemeProvider>().isDarkMode,
                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme(value);
                },
                secondary: const Icon(Icons.dark_mode),
              ),

              const Divider(color: Colors.white70),

              // Términos y condiciones
              ListTile(
                leading: const Icon(Icons.description, color: Colors.white),
                title: const Text(
                  'Términos y condiciones',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermConditionScreen(),
                    ),
                  );
                },
              ),

              // Compartir app
              ListTile(
                leading: const Icon(Icons.share, color: Colors.white),
                title: const Text(
                  'Compartir esta app',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Share.share("¡Descubre esta app de plantas medicinales!");
                },
              ),

              // Créditos
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.white),
                title: const Text(
                  'Créditos',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreditScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Botón de cerrar sesión
              ElevatedButton.icon(
                onPressed: () => AuthRepository.cerrarSesion(context),
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**✅ ¿Qué hace esta pantalla?
Cambia el modo oscuro/localmente (puede conectarse a un Provider o Bloc).

Muestra un popup con términos y condiciones.

Comparte un mensaje con enlace a la app usando share_plus.

Navega a la pantalla de créditos.*/
