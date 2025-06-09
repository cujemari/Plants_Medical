import 'package:app_plants/presentation/views/home/start_page.dart';
import 'package:app_plants/presentation/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_plants/presentation/views/detalle/setting/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode),
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
      routes: {'/home': (context) => StartPage()},
    );
  }
}
