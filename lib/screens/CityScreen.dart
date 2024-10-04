import 'package:flutter/material.dart';
import 'package:meteo_flutter/Functions/fetchCityTemperature.dart'; // Assurez-vous que ce fichier est correct
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meteo_flutter/components/CityInputField.dart';
import 'package:meteo_flutter/components/CityTemperatureWidget.dart';
import 'package:meteo_flutter/components/WeatherIconWidget.dart';
import 'package:meteo_flutter/components/HourlyForecastWidget.dart'; // Ajout du widget pour les prévisions horaires
import 'package:meteo_flutter/Functions/fetchHourlyForecast.dart'; // Ajout de la fonction pour les prévisions horaires

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? selectedCity;
  double? cityTemperature;
  int? weatherCode;
  List<Map<String, dynamic>>? hourlyForecast; // Ajout des prévisions horaires
  bool isLoading = false;
  bool isNight = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadSavedCity();
  }

  Future<void> loadSavedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedCity = prefs.getString('selectedCity');

    if (savedCity != null) {
      searchCityWeather(savedCity);
    }
  }

  Future<void> saveCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCity', cityName);
  }

  void searchCityWeather(String cityName) async {
    setState(() {
      isLoading = true;
      errorMessage = null; // Clear previous errors
    });

    var weatherData = await fetchCityWeather(cityName);
    var forecastData = await fetchHourlyForecast(
        cityName); // Récupérer les prévisions horaires

    if (weatherData != null && forecastData != null) {
      setState(() {
        selectedCity = cityName;
        cityTemperature = weatherData['temperature'];
        weatherCode = weatherData['weatherCode'];
        hourlyForecast = forecastData; // Stocker les prévisions
        isNight = DateTime.now().hour >= 18 || DateTime.now().hour <= 6;
        isLoading = false;
      });
      saveCity(cityName);
    } else {
      setState(() {
        isLoading = false;
        errorMessage = 'City not found or API error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Météo App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: CityInputField(
              onCitySubmitted: searchCityWeather,
            ),
          ),
          const SizedBox(height: 20),
          if (isLoading) const CircularProgressIndicator(),
          if (errorMessage != null)
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
          if (!isLoading &&
              selectedCity != null &&
              cityTemperature != null &&
              weatherCode != null)
            Column(
              children: [
                const SizedBox(height: 20),
                CityTemperatureWidget(
                  cityName: selectedCity!,
                  temperature: cityTemperature!,
                ),
                const SizedBox(height: 40),
                WeatherIconWidget(
                  weatherCode: weatherCode!,
                  isNight: isNight,
                ),
                const SizedBox(height: 40),
                if (hourlyForecast != null)
                  HourlyForecastWidget(
                    hourlyForecast: hourlyForecast!,
                    isNight: isNight, // Passer l'information du jour/nuit
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
