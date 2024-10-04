import 'package:flutter/material.dart';
import 'HourWeatherWidget.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<Map<String, dynamic>> hourlyForecast;
  final bool isNight;

  const HourlyForecastWidget({
    required this.hourlyForecast,
    required this.isNight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: hourlyForecast.map((hourData) {
        return HourWeatherWidget(
          time: hourData['time'],
          temperature: hourData['temperature'],
          weatherCode: hourData['weatherCode'],
          isNight: isNight,
        );
      }).toList(),
    );
  }
}
