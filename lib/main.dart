import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';
import 'package:app_plants/presentation/themes/theme_provider.dart';
import 'package:app_plants/presentation/viewmodels/configuracion_view_model.dart';
import 'package:app_plants/presentation/viewmodels/disease_json.dart';
import 'package:app_plants/presentation/viewmodels/distribution_json.dart';
import 'package:app_plants/presentation/viewmodels/favorites_view_model.dart';
import 'package:app_plants/presentation/viewmodels/plant_json.dart';
import 'package:app_plants/presentation/viewmodels/profile_view_model.dart';
import 'package:app_plants/presentation/viewmodels/search_plant_view_model.dart';
import 'package:app_plants/presentation/viewmodels/start_page_view_model.dart';
import 'package:app_plants/presentation/viewmodels/uses_json.dart';
import 'package:app_plants/presentation/views/auth/login_screen.dart';
import 'package:app_plants/presentation/views/details/plant/detail_medicinal_plant.dart';
import 'package:app_plants/presentation/views/home/start_page_screen.dart';
import 'package:app_plants/presentation/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PlantJson().cargarPlantasDesdeJson();
  await DiseaseJson().cargarEnfermedadesDesdeJson();
  await UsesJson().cargarUsosDesdeJson();
  await DistributionJson().cargarDistribucion();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromARGB(255, 151, 224, 157),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5CE65C),
          foregroundColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => StartPageScreen(),
        '/detallePlanta': (context) {
          final plantId = ModalRoute.of(context)!.settings.arguments as int;
          return DetailsMedicinalPlants(plantaId: plantId);
        },
      },
    );
  }
}
