import 'package:app_plants/presentation/viewmodels/configuracion_view_model.dart';
import 'package:app_plants/presentation/wigets/setting_widgets/setting_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/theme_provider.dart';
import '../details/setting/credit_screen.dart';
import '../details/setting/term_condition_screen.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConfiguracionViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/config.png'),
              const SizedBox(height: 20),

              SwitchListTile(
                title: const Text('Modo oscuro'),
                value: context.watch<ThemeProvider>().isDarkMode,
                onChanged: (value) =>
                    context.read<ThemeProvider>().toggleTheme(value),
                secondary: const Icon(Icons.dark_mode),
              ),

              const Divider(color: Colors.white70),

              SettingTile(
                icon: Icons.description,
                title: 'Términos y condiciones',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TermConditionScreen(),
                    ),
                  );
                },
              ),

              SettingTile(
                icon: Icons.share,
                title: 'Compartir esta app',
                onTap: viewModel.compartirApp,
              ),

              SettingTile(
                icon: Icons.info_outline,
                title: 'Créditos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CreditScreen()),
                  );
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () => viewModel.cerrarSesion(context),
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
