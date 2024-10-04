import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart'; // Utiliser weather_icons

class WeatherIconWidget extends StatelessWidget {
  final int weatherCode; // Ajout du code météo
  final bool isNight; // Pour gérer la différence jour/nuit

  const WeatherIconWidget(
      {required this.weatherCode, required this.isNight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    // Mapper les codes OpenWeatherMap vers des icônes
    if (weatherCode >= 200 && weatherCode <= 232) {
      iconData = WeatherIcons.thunderstorm;
    } else if (weatherCode >= 300 && weatherCode <= 321) {
      iconData = WeatherIcons.showers;
    } else if (weatherCode >= 500 && weatherCode <= 531) {
      iconData = WeatherIcons.rain;
    } else if (weatherCode >= 600 && weatherCode <= 622) {
      iconData = WeatherIcons.snow;
    } else if (weatherCode >= 701 && weatherCode <= 781) {
      iconData = WeatherIcons.fog;
    } else if (weatherCode == 800) {
      iconData = isNight ? WeatherIcons.night_clear : WeatherIcons.day_sunny;
    } else if (weatherCode >= 801 && weatherCode <= 804) {
      iconData = isNight ? WeatherIcons.night_alt_cloudy : WeatherIcons.cloud;
    } else {
      iconData = WeatherIcons.na; // Icône par défaut pour condition inconnue
    }

    return Icon(
      iconData,
      size: 140.0,
      color:
          isNight ? Colors.blueGrey : Colors.orangeAccent, // Couleur jour/nuit
    );
  }
}
