// import 'package:flutter/material.dart';

// class ForecastPage extends StatelessWidget {
//   const ForecastPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample 5-day forecast data
//     final List<Map<String, dynamic>> forecastData = [
//       {
//         "day": "Monday",
//         "icon": Icons.wb_sunny,
//         "temp": "25",
//         "condition": "Sunny"
//       },
//       {
//         "day": "Tuesday",
//         "icon": Icons.cloud,
//         "temp": "22",
//         "condition": "Cloudy",
//       },
//       {
//         "day": "Wedensday",
//         "icon": Icons.wb_cloudy,
//         "temp": "20",
//         "condition": "Rainy"
//       },
//       {
//         "day": "Thuursday",
//         "icon": Icons.bolt,
//         "temp": "18",
//         "condition": "Thunder",
//       },
//       {
//         "day": "Friday",
//         "icon": Icons.ac_unit,
//         "temp": "15",
//         "condition": "Snow",
//       },
//     ];

//     return Scaffold(
//       backgroundColor: Color(0xff1F1D47),
//       appBar: AppBar(
//         title: const Text("5-Day Forecast"),
//         centerTitle: true,
//         backgroundColor: Color(0xff1F1D47),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: forecastData.length,
//         itemBuilder: (context, index) {
//           final forecast = forecastData[index];
//           return Padding(
//             padding: const EdgeInsets.only(top: 45),
//             child: Container(
//               width: 320,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: Color(0xffC427FB),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Positioned(
//                     top: 20,
//                     left: 20,
//                     child: Text(
//                       "${forecast["day"]}",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 80,
//                     left: 20,
//                     child: Text(
//                       "H:24°  L:18°",
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     left: 20,
//                     child: Text(
//                       "Montreal, Canada",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 40,
//                     right: 20,
//                     child: Text(
//                       "${forecast["condition"]}",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: -45,
//                     right: 20,
//                     child: Image.asset(
//                       "assets/images/Moon_cloud_mid_rain.png", // Use your cloud/rain icon
//                       width: 100,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubits/cubit/weather_cubit.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D47),
      appBar: AppBar(
        title: const Text("Weather Forecast"),
        centerTitle: true,
        backgroundColor: const Color(0xff1F1D47),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is weatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is weatherFailure) {
            return const Center(child: Text("Failed to load forecast"));
          } else if (state is weatherSuccess) {
            List<WeatherModel> forecasts = state.weatherModel.forecasts;
            if (forecasts.isEmpty) {
              return const Center(child: Text("No forecast data available"));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: forecasts.length,
              itemBuilder: (context, index) {
                final forecast = forecasts[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Container(
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xffC427FB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Text(
                            forecast.date.toString().split(" ")[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 20,
                          child: Text(
                            "H:${forecast.maxTemp.toInt()}°  L:${forecast.minTemp.toInt()}°",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          right: 20,
                          child: Text(
                            forecast.weatherStateName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -45,
                          right: 20,
                          child: Image.asset(
                            forecast.getImage(),
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("Enter a city to get the forecast"));
        },
      ),
    );
  }
}
