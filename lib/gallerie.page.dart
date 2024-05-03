import 'package:flutter/material.dart';
import 'package:voyage/pages/gallerie-details.page.dart';

class Gallerie extends StatelessWidget {
  final TextEditingController txt_keywords = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gallerie Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image.jpg",
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: txt_keywords,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.photo),
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
                  _onGetGallerieDetails(context);
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

  void _onGetGallerieDetails(BuildContext context) {
    String keyword = txt_keywords.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GallerieDetails(keyword),
      ),
    );
  }
}
