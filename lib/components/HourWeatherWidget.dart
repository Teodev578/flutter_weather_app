import 'package:flutter/material.dart';

class HourWeatherWidget extends StatelessWidget {
  final String time;
  final double temperature;
  final int weatherCode;
  final bool isNight;

  const HourWeatherWidget({
    required this.time,
    required this.temperature,
    required this.weatherCode,
    required this.isNight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isNight
            ? Colors.blueGrey
            : Colors.orangeAccent, // Couleur de fond selon le jour/nuit
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            time.split(' ')[1], // Afficher uniquement l'heure
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            '${temperature.toStringAsFixed(1)}°C',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 5),
          // Un icône pourrait être ajouté ici en fonction du weatherCode
          Icon(
            weatherCode < 600
                ? Icons.cloud
                : Icons
                    .wb_sunny, // Ex : afficher soleil ou nuage selon la météo
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
