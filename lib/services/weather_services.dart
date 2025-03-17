// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:weather_app_v2/models/weather_model.dart';

// class WeatherService {
//   String baseUrl = "http://api.weatherapi.com/v1";
//   String apiKey = "27aff0bcffa44a97989170345252201";
//   Future<WeatherModel?> getWeather({required String cityName}) async {
//     WeatherModel? weather;
//     try {
//       Uri url =
//           Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
//       http.Response response = await http.get(url);
//       Map<String, dynamic> data = jsonDecode(response.body);
//       weather = WeatherModel.fromJson(data);
//     } catch (e) {
//       print(e);
//     }

//     return weather;
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "27aff0bcffa44a97989170345252201";

  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url =
          Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        print("Failed to load weather data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching weather data: $e");
      return null;
    }
  }
}
