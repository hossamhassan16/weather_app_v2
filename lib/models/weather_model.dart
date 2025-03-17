class WeatherModel {
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date: DateTime.parse(data["location"]["localtime"]),
        temp: jsonData["avgtemp_c"],
        minTemp: jsonData["mintemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        weatherStateName: data["current"]["condition"]["text"]);
  }

  String getImage() {
    if (weatherStateName == "Clear" || weatherStateName == "Light cloud") {
      return "assets/images/Moon_cloud_fast_wind.png";
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return "assets/images/Moon_cloud_mid_rain.png";
    } else if (weatherStateName == "Heavy cloud" ||
        weatherStateName == "Partly cloudy" ||
        weatherStateName == "Mist" ||
        weatherStateName == "Overcast") {
      return "assets/images/Moon_cloud_mid_rain.png";
    } else if (weatherStateName == "Light rain" ||
        weatherStateName == "Heavy rain" ||
        weatherStateName == "Showers") {
      return "assets/images/Sun_cloud_angled_rain.png";
    } else if (weatherStateName == "Thunderstorm" ||
        weatherStateName == "Thunder") {
      return "assets/images/Tornado.png";
    } else {
      return "assets/images/clear.png";
    }
  }
}
