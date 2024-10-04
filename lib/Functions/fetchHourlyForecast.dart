import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '3fab2f399407e736f1d3f631c2d7de5f';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';

Future<List<Map<String, dynamic>>?> fetchHourlyForecast(String cityName) async {
  final Uri url = Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric');

  try {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Extraire les données des 5 prochaines heures
      List<dynamic> hourlyData = data['list'].take(5).toList();
      return hourlyData.map((hour) {
        return {
          'time': hour['dt_txt'], // Date et heure
          'temperature': hour['main']['temp'], // Température
          'weatherCode': hour['weather'][0]['id'], // Code météo
        };
      }).toList();
    } else {
      print('Erreur: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Erreur lors de la requête: $e');
    return null;
  }
}
