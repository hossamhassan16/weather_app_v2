import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubits/cubit/weather_cubit.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/src/curved_navigation_bar.dart';
import 'package:weather_app_v2/views/default_body.dart';
import 'package:weather_app_v2/views/forecast_page.dart';
import 'package:weather_app_v2/views/search_page.dart';
import 'package:weather_app_v2/views/success_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _page = 0; // Current tab index
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  void _changeTab(int index) {
    setState(() {
      _page = index;
    });
  }

  late final List<Widget> _screens = [
    HomeScreen(), // Home Page
    ForecastPage(), // Weather Forecast
    SearchPage(onTabChange: _changeTab), // Pass callback to SearchPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page, // Keep pages alive
        children: _screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: const [
          Icon(Icons.home, size: 30, color: Color(0xff48319D)),
          Icon(Icons.cloud, size: 30, color: Color(0xff48319D)),
          Icon(Icons.search, size: 30, color: Color(0xff48319D)),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xff48319D),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          _changeTab(index);
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is weatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is weatherSuccess) {
          return SuccessBody(weatherData: state.weatherModel);
        } else {
          return DefaultBody();
        }
      },
    );
  }
}
