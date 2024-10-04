import 'package:flutter/material.dart';
import 'package:meteo_flutter/screens/CityScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Utiliser le thème clair
      darkTheme: ThemeData.dark(), // Utiliser le thème sombre
      themeMode: ThemeMode
          .system, // Définit si l'application utilise le thème clair ou sombre en fonction des préférences de l'utilisateur
      home: const CityScreen(), // Utilisation de l'écran avec CityInputField
    );
  }
}
