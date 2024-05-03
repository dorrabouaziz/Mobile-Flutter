import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/pays-details-page.dart';

class Pays extends StatelessWidget {
  final TextEditingController txt_keywords = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pays Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: MyDarwer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/city.jpg",
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: txt_keywords,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city_rounded),
                    hintText: "keywords",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 5),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Ajustement de la taille de l'entrée de texte
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _onGetPaysDetails(context);
                },
                child: Text("Chercher"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder( // Rendre le bouton rectangulaire
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onGetPaysDetails(BuildContext context) {
    String ville = txt_keywords.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaysDetailsPage(country: ville,),
      ),
    );
  }
}
