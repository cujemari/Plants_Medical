import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_plants/presentation/themes/theme_provider.dart';
import 'package:app_plants/presentation/viewmodels/configuracion_view_model.dart';
import 'package:app_plants/presentation/viewmodels/favorites_view_model.dart';
import 'package:app_plants/presentation/viewmodels/profile_view_model.dart';
import 'package:app_plants/presentation/viewmodels/search_plant_view_model.dart';
import 'package:app_plants/presentation/viewmodels/start_page_view_model.dart';
import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';

Future<List<SingleChildWidget>> initializeProviders() async {
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;

  return [
    ChangeNotifierProvider(create: (_) => StartPageViewModel()),
    ChangeNotifierProvider(create: (_) => SearchPlantViewModel()),
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode)),
    ChangeNotifierProvider(create: (_) => ConfiguracionViewModel()),

    ChangeNotifierProvider(
      create: (_) =>
          FavoritesViewModel(FavoriteplantRepositoryImpl())..loadFavorites(),
    ),
  ];
}
