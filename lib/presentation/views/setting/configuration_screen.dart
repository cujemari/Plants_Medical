import 'package:app_plants/presentation/views/details/setting/credit_screen.dart';
import 'package:app_plants/presentation/views/details/setting/term_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_plants/presentation/viewmodels/configuracion_view_model.dart';
import 'package:app_plants/presentation/themes/theme_provider.dart';
import 'package:app_plants/presentation/wigets/setting_widgets/setting_title.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConfiguracionViewModel>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/config.png'),
              const SizedBox(height: 30),

              // Modo oscuro
              SwitchListTile(
                title: const Text('Modo oscuro'),
                value: context.watch<ThemeProvider>().isDarkMode,
                onChanged: (value) =>
                    context.read<ThemeProvider>().toggleTheme(value),
                secondary: const Icon(Icons.dark_mode),
              ),

              const Divider(color: Colors.white70),

              // Términos
              SettingTile(
                icon: Icons.description,
                title: 'Términos y condiciones',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermConditionScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              // Créditos
              SettingTile(
                icon: Icons.info_outline,
                title: 'Créditos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreditScreen()),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Botón de cerrar sesión
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: const Text('Cierre de sesión'),
                      content: const Text(
                        '¿Estás seguro de que deseas cerrar sesión?',
                      ),
                      actions: [
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Sí'),
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                            viewModel.cerrarSesion(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
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
