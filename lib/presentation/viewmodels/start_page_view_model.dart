import 'package:app_plants/presentation/views/setting/configuration_screen.dart';
import 'package:app_plants/presentation/views/favorites/favorites_plant_screen.dart';
import 'package:app_plants/presentation/views/home/home_page_screen.dart';
import 'package:app_plants/presentation/views/profile/profile_screen.dart';
import 'package:app_plants/presentation/views/search/search_plant_screen.dart';
import 'package:flutter/material.dart';

class StartPageViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> get pages => const [
    HomePage(),
    SearchPlantScreen(),
    FavoritesPlantScreen(),
    ProfileScreen(),
    ConfiguracionScreen(),
  ];
}
