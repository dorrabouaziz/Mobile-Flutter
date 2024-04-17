import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MeteoDetailsPage extends StatefulWidget {
  String ville = "";

  MeteoDetailsPage(this.ville);

  @override
  State<MeteoDetailsPage> createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    print("Météo de la ville de " + ville);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=sfax&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(this.meteoData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meteo Détails Page ${widget.ville}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: (meteoData == null ? 0 : meteoData['list'].length),
        itemBuilder: (context, index) {
          var forecast = meteoData['list'][index];
          var date = DateTime.fromMillisecondsSinceEpoch(forecast['dt'] * 1000);
          var temperature = (forecast['main']['temp']/10).toInt();
          var weatherDescription = forecast['weather'][0]['main'].toString().toLowerCase();
          var time = DateFormat.jm().format(date);
          return Card(
            color: Colors.cyan.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/${forecast['weather'][0]['main'].toString().toLowerCase()}.png",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${DateFormat('E-dd/MM/yyyy').format(date)}",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text("$time - $weatherDescription"),
                      ],
                    ),
                  ],
                ),
                Text("$temperature"),
              ],
            ),
          );
        },
      ),
    );
  }
}
