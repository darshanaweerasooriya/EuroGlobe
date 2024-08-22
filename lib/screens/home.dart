import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'detail.dart';




class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<dynamic> countries = [];
  List<dynamic> filteredCountries = [];
  String searchQuery = '';
  String sortOption = '';

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      var response = await Dio().get(
        'https://restcountries.com/v3.1/region/europe?fields=name,capital,flags,population',
      );
      setState(() {
        countries = response.data;
        filteredCountries = countries;
      });
    } catch (e) {
      print(e);
    }
  }

  void searchCountries(String query) {
    final results = countries.where((country) {
      final nameLower = country['name']['common'].toLowerCase();
      final capitalLower = country['capital']?[0]?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          capitalLower.contains(searchLower);
    }).toList();

    setState(() {
      searchQuery = query;
      filteredCountries = results;
    });
  }

  void sortCountries(String? option) {
    if (option == null) return;

    List<dynamic> sortedList = [...filteredCountries];

    switch (option) {
      case 'Name A-Z':
        sortedList.sort((a, b) => a['name']['common'].compareTo(b['name']['common']));
        break;
      case 'Capital A-Z':
        sortedList.sort((a, b) => (a['capital']?[0] ?? '').compareTo(b['capital']?[0] ?? ''));
        break;
      case 'Population':
        sortedList.sort((a, b) => a['population'].compareTo(b['population']));
        break;
    }

    setState(() {
      sortOption = option;
      filteredCountries = sortedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: filteredCountries.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchCountries,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          DropdownButton<String>(
            value: sortOption.isEmpty ? null : sortOption,
            hint: Text(
              'Sort',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.blueAccent,
              size: 30,
            ),
            iconSize: 30,
            elevation: 16,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            items: <String>['Name A-Z', 'Capital A-Z', 'Population']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: sortCountries,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = filteredCountries[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CountryDetailScreen(country: country),
                        ),
                      );
                    },
                    child: CountryCard(country: country),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryCard({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              country['flags']['png'],
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              country['name']['common'],
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Capital: ${country['capital'] != null ? country['capital'][0] : 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Population: ${country['population']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}