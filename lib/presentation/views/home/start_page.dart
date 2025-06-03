import 'package:app_plants/presentation/views/home/configuration_screen.dart';
import 'package:app_plants/presentation/views/home/favorites_plant_screen.dart';
import 'package:app_plants/presentation/views/home/home_page.dart';
import 'package:app_plants/presentation/views/home/profile_screen.dart';
import 'package:app_plants/presentation/views/home/search_plant_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const SearchPlantScreen(),
    FavoritesPlantScreen(),
    ProfileScreen(),
    ConfiguracionScreen(),
  ];

  @override
  void initState() {
    super.initState();

    // Aquí defines las páginas con un botón en la pestaña de "Inicio"
    _pages.addAll([
      const Center(child: Text("Inicio")),
      const Center(child: Text('Buscar')),
      const Center(child: Text('Favoritos')),
      const Center(child: Text('Usuario')),
      const Center(child: Text('Configuración')),
    ]);
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B918A),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logos/logo.png', height: 50),
            const SizedBox(width: 10),
            const Text(
              'PLANTAS MEDICINALES',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                letterSpacing: 1.3,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        iconSize: 30.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuario'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}
