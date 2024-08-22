import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryDetailScreen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EuroGlobe'),
        backgroundColor: Colors.black,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                country['flags']['png'],
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Capital: ${country['capital'] != null ? country['capital'][0] : 'N/A'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Population: ${country['population']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Region: ${country['region']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Subregion: ${country['subregion']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
