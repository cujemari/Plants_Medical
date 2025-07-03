import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:app_plants/presentation/viewmodels/start_page_view_model.dart';

class StartPageScreen extends StatefulWidget {
  const StartPageScreen({super.key});

  @override
  State<StartPageScreen> createState() => _StartPageScreenState();
}

class _StartPageScreenState extends State<StartPageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initDynamicLinks();
    });
  }

  void _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen(
      (dynamicLinkData) {
        _handleDeepLink(dynamicLinkData.link);
      },
      onError: (error) {
        debugPrint('Error en el enlace dinámico: $error');
      },
    );

    final initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      _handleDeepLink(initialLink.link);
    }
  }

  void _handleDeepLink(Uri link) {
    final plantId = int.tryParse(link.queryParameters['plant_id'] ?? '');
    if (plantId != null) {
      Navigator.pushNamed(context, '/detallePlanta', arguments: plantId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StartPageViewModel>();
    final orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/logos/logo.png',
                  height: isLandscape ? 50 : 60,
                ),
              ),
            ),
            const Text(
              'PLANTAS MEDICINALES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Georgia",
                fontWeight: FontWeight.bold,
                letterSpacing: 0.10,
              ),
            ),
          ],
        ),
      ),
      body: viewModel.pages[viewModel.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        selectedFontSize: 12,
        unselectedFontSize: 10,
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
