import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voyage/menu/drawer.widget.dart';

class PaysDetailsPage extends StatelessWidget {
  final String country;

  const PaysDetailsPage({Key? key, required this.country}) : super(key: key);

  Future<Map<String, dynamic>> fetchCountryData() async {
    final response = await http.get(
        Uri.parse('https://restcountries.com/v2/name/$country'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)[0];
      print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception('Failed to load country data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Détails de $country',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: MyDarwer(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchCountryData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Erreur: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("Pas de données disponibles"),
            );
          } else {
            var countryData = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          countryData['flags']['png'],
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.cyan.shade50,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildDetailItem('Name', countryData['name']),
                          _buildDetailItem('Capital', countryData['capital']),
                          _buildDetailItem('Region', countryData['region']),
                          _buildDetailItem('Area', countryData['area'].toString()),
                          _buildDetailItem('Population', countryData['population'].toString()),
                          _buildDetailItem('Languages', countryData['languages'].map((lang) => lang['name']).join(', ')),
                          _buildDetailItem('Timezones', countryData['timezones'].join(', ')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
