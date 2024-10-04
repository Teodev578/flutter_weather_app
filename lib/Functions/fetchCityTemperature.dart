import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '3fab2f399407e736f1d3f631c2d7de5f';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

Future<Map<String, dynamic>?> fetchCityWeather(String cityName) async {
  final Uri url = Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric');

  try {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      double temperature = data['main']['temp'];
      int weatherCode = data['weather'][0]['id']; // Code météo
      return {
        'temperature': temperature,
        'weatherCode': weatherCode, // Récupérer le code météo
      };
    } else {
      print('Erreur: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Erreur lors de la requête: $e');
    return null;
  }
}
