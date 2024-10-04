import 'package:flutter/material.dart';

class CityTemperatureWidget extends StatelessWidget {
  final String cityName;
  final double temperature;

  const CityTemperatureWidget({
    Key? key,
    required this.cityName,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cityName,
          style: TextStyle(
            fontSize: 30,
            //fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${temperature.toStringAsFixed(1)}°C',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            //color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
