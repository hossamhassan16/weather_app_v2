import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubits/cubit/weather_cubit.dart';

class SearchPage extends StatefulWidget {
  final Function(int) onTabChange; // Callback to switch tabs

  const SearchPage({super.key, required this.onTabChange});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _recentSearches = ["Cairo", "London", "New York", "Paris"];

  void _onSearch(String cityName) {
    if (cityName.isNotEmpty) {
      BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName);
      BlocProvider.of<WeatherCubit>(context).cityName = cityName;

      setState(() {
        // Add the search term to recent searches and ensure max 5 items
        if (!_recentSearches.contains(cityName)) {
          _recentSearches.insert(0, cityName);
          if (_recentSearches.length > 5) _recentSearches.removeLast();
        }
        _searchController.clear(); // Clear the search bar after search
      });

      widget.onTabChange(0); // Navigate to Home tab
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D47),
      appBar: AppBar(
        title: const Text("Search City"),
        centerTitle: true,
        backgroundColor: const Color(0xff1F1D47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Enter city name...",
                prefixIcon: GestureDetector(
                  onTap: () {
                    if (_searchController.text.trim().isNotEmpty) {
                      _onSearch(_searchController.text.trim());
                    }
                  },
                  child: const Icon(Icons.search, color: Color(0xff48319D)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (cityName) {
                if (cityName.trim().isNotEmpty) {
                  _onSearch(cityName.trim());
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _recentSearches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.location_city,
                        color: Color(0xff48319D)),
                    title: Text(_recentSearches[index]),
                    onTap: () {
                      _onSearch(_recentSearches[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
