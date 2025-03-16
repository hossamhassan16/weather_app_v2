import 'package:flutter/material.dart';
import 'package:weather_app_v2/core/utils/styles.dart';
import 'package:weather_app_v2/curved_navigation_bar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  // ignore: unused_field
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Color(0xff48319D),
          ),
          Icon(
            Icons.cloud,
            size: 30,
            color: Color(0xff48319D),
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Color(0xff48319D),
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Color(0xff48319D),
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Color(0xff48319D),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xff48319D),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
