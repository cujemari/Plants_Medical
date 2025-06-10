import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';
import 'package:app_plants/presentation/themes/theme_provider.dart';
import 'package:app_plants/presentation/viewmodels/configuracion_view_model.dart';
import 'package:app_plants/presentation/viewmodels/favorites_view_model.dart';
import 'package:app_plants/presentation/viewmodels/profile_view_model.dart';
import 'package:app_plants/presentation/viewmodels/search_plant_view_model.dart';
import 'package:app_plants/presentation/viewmodels/start_page_view_model.dart';
import 'package:app_plants/presentation/views/auth/login_screen.dart';
import 'package:app_plants/presentation/views/home/start_page_screen.dart';
import 'package:app_plants/presentation/views/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StartPageViewModel()),
        ChangeNotifierProvider(create: (_) => SearchPlantViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode)),
        ChangeNotifierProvider(create: (_) => ConfiguracionViewModel()),
        ChangeNotifierProvider(
          create: (_) =>
              FavoritesViewModel(FavoriteplantRepositoryImpl())
                ..loadFavorites(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: "PLANTAS MEDICINALES",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDarkMode ? ThemeMode.light : ThemeMode.dark,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => StartPageScreen(),
      },
    );
  }
}
