import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/core/utils/styles.dart';
import 'package:weather_app_v2/cubits/cubit/weather_cubit.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key, required this.weatherData});
  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_page_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName!,
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            Text(
              "${weatherData!.temp.toInt()}°",
              style: style50,
            ),
            Text(
              "Mostly clear",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "L:${weatherData!.minTemp.toInt()}°",
                  style: style18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "H:${weatherData!.maxTemp.toInt()}°",
                  style: style18,
                ),
              ],
            ),
            Image.asset("assets/images/house.png"),
          ],
        ),
      ),
    );
  }
}
