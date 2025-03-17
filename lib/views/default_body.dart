import 'package:flutter/material.dart';
import 'package:weather_app_v2/core/utils/styles.dart';

class DefaultBody extends StatelessWidget {
  const DefaultBody({super.key});

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
              "Cairo",
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            Text(
              "19°",
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
                  "H:24°",
                  style: style18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "L:18°",
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
