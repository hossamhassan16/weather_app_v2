// class WeatherModel {
//   DateTime date;
//   double temp;
//   double minTemp;
//   double maxTemp;
//   String weatherStateName;

//   WeatherModel(
//       {required this.date,
//       required this.temp,
//       required this.minTemp,
//       required this.maxTemp,
//       required this.weatherStateName});
//   factory WeatherModel.fromJson(dynamic data) {
//     var jsonData = data["forecast"]["forecastday"][0]["day"];
//     return WeatherModel(
//         date: DateTime.parse(data["location"]["localtime"]),
//         temp: jsonData["avgtemp_c"],
//         minTemp: jsonData["mintemp_c"],
//         maxTemp: jsonData["maxtemp_c"],
//         weatherStateName: data["current"]["condition"]["text"]);
//   }

//   String getImage() {
//     if (weatherStateName == "Clear" || weatherStateName == "Light cloud") {
//       return "assets/images/Moon_cloud_fast_wind.png";
//     } else if (weatherStateName == "Sleet" ||
//         weatherStateName == "Snow" ||
//         weatherStateName == "Hail") {
//       return "assets/images/Moon_cloud_mid_rain.png";
//     } else if (weatherStateName == "Heavy cloud" ||
//         weatherStateName == "Partly cloudy" ||
//         weatherStateName == "Mist" ||
//         weatherStateName == "Overcast") {
//       return "assets/images/Moon_cloud_mid_rain.png";
//     } else if (weatherStateName == "Light rain" ||
//         weatherStateName == "Heavy rain" ||
//         weatherStateName == "Showers") {
//       return "assets/images/Sun_cloud_angled_rain.png";
//     } else if (weatherStateName == "Thunderstorm" ||
//         weatherStateName == "Thunder") {
//       return "assets/images/Tornado.png";
//     } else {
//       return "assets/images/clear.png";
//     }
//   }
// }
class WeatherModel {
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;
  List<WeatherModel> forecasts; // List of additional forecast days

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStateName,
    required this.forecasts,
  });

  factory WeatherModel.fromJson(dynamic data) {
    // Extract forecast days based on the given indices
    List<int> daysToFetch = [0, 1, 2]; // Fetch today, tomorrow, and 3rd day
    List<WeatherModel> forecastDays = daysToFetch
        .where((index) =>
            index <
            data["forecast"]["forecastday"].length) // Ensure index exists
        .map((index) {
      var dayData = data["forecast"]["forecastday"][index];
      return WeatherModel(
        date: DateTime.parse(dayData["date"]), // Correct date for each day
        temp: dayData["day"]["avgtemp_c"],
        minTemp: dayData["day"]["mintemp_c"],
        maxTemp: dayData["day"]["maxtemp_c"],
        weatherStateName: dayData["day"]["condition"]["text"],
        forecasts: [], // No nested forecasts inside individual days
      );
    }).toList();

    // Create the main WeatherModel with forecasts
    return WeatherModel(
      date: DateTime.parse(data["location"]["localtime"]),
      temp: forecastDays[0].temp, // Use the first day's temp
      minTemp: forecastDays[0].minTemp,
      maxTemp: forecastDays[0].maxTemp,
      weatherStateName: forecastDays[0].weatherStateName,
      forecasts: forecastDays, // Store the forecast days list
    );
  }

  String getImage() {
    switch (weatherStateName) {
      case "Clear":
      case "Light cloud":
        return "assets/images/Sunny.png";
      case "Sleet":
      case "Snow":
      case "Hail":
      case "Heavy cloud":
      case "Partly cloudy":
      case "Mist":
      case "Overcast":
        return "assets/images/Sun_cloud_mid_rain.png";
      case "Light rain":
      case "Heavy rain":
      case "Showers":
      case "Sunny":
        return "assets/images/Sunny.png";
      case "Thunderstorm":
      case "Thunder":
        return "assets/images/Tornado.png";
      default:
        return "assets/images/Moon_cloud_fast_wind.png";
    }
  }
}
