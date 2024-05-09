import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voyage/menu/drawer.widget.dart';

class GallerieDetails extends StatefulWidget {
  String keywords = "";

  GallerieDetails(this.keywords);

  @override
  State<GallerieDetails> createState() => _GallerieDetailsState();
}

class _GallerieDetailsState extends State<GallerieDetails> {
  int currentPage = 1;
  int size = 10;
  int totalPages = 1;
  ScrollController _scrollController = ScrollController();
  List<dynamic> hits = [];
  var gallerieData;

  void initState() {
    super.initState();
    getGallerieData(widget.keywords);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGallerieData(widget.keywords);
        }
      }
    });
  }

  void getGallerieData(String keywords) async {
    print("Gallerie détails de $keywords");
    String url =
        'https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=$keywords&page=$currentPage&per_page=$size';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        gallerieData = json.decode(response.body);
        totalPages = (gallerieData['totalHits'] / size).ceil();
        hits = gallerieData['hits'] ?? []; // Assign hits with null-safe operator
      });
    } else {
      print('Error fetching data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text(
          "${widget.keywords}   Page $currentPage / $totalPages",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: MyDarwer(),
      body: (gallerieData == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: hits.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  gallerieData['hits']?[index]['tags'] ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Card(
                  child: Image.network(
                    gallerieData['hits']?[index]['previewURL'] ?? "",
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 400,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
