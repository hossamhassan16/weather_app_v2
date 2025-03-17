import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample 5-day forecast data
    final List<Map<String, dynamic>> forecastData = [
      {
        "day": "Mon",
        "icon": Icons.wb_sunny,
        "temp": "25",
        "condition": "Sunny"
      },
      {
        "day": "Tue",
        "icon": Icons.cloud,
        "temp": "22",
        "condition": "Cloudy",
      },
      {
        "day": "Wed",
        "icon": Icons.wb_cloudy,
        "temp": "20",
        "condition": "Rainy"
      },
      {
        "day": "Thu",
        "icon": Icons.bolt,
        "temp": "18",
        "condition": "Thunder",
      },
      {
        "day": "Fri",
        "icon": Icons.ac_unit,
        "temp": "15",
        "condition": "Snow",
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xff1F1D47),
      appBar: AppBar(
        title: const Text("5-Day Forecast"),
        centerTitle: true,
        backgroundColor: Color(0xff1F1D47),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          final forecast = forecastData[index];
          return Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              width: 320,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xffC427FB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "${forecast["day"]} - ${forecast["temp"]}°",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Text(
                      "H:24°  L:18°",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Montreal, Canada",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 20,
                    child: Text(
                      "${forecast["condition"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -45,
                    right: 20,
                    child: Image.asset(
                      "assets/images/Moon_cloud_mid_rain.png", // Use your cloud/rain icon
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// Card(
//             color: Colors.white,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: ListTile(
//               leading: Icon(
//                 forecast["icon"],
//                 size: 40,
//                 color: Color(0xff48319D),
//               ),
//               title: Text(
//                 "${forecast["day"]} - ${forecast["temp"]}",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 forecast["condition"],
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             ),
//           )