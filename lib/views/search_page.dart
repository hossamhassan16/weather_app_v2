import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _recentSearches = ["Cairo", "London", "New York", "Paris"];

  void _onSearch() {
    String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty && !_recentSearches.contains(searchText)) {
      setState(() {
        _recentSearches.insert(0, searchText);
        if (_recentSearches.length > 5) _recentSearches.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1D47),
      appBar: AppBar(
        title: Text("Search City"),
        centerTitle: true,
        backgroundColor: Color(0xff1F1D47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                label: Text(
                  "Search",
                ),
                hintText: "Enter city name...",
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff48319D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (value) => _onSearch(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _recentSearches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Icon(Icons.location_city, color: Color(0xff48319D)),
                    title: Text(_recentSearches[index]),
                    onTap: () {
                      _searchController.text = _recentSearches[index];
                      _onSearch();
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
