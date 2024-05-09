import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:voyage/menu/drawer.widget.dart';

import 'config/global.params.dart';

class Parametres extends StatefulWidget {
  @override
  _ParametresState createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  String? mode = 'Jour'; // État du mode sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paramètres",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: MyDarwer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Capture.PNG'),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Mode',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              RadioListTile(
                title: Text('Jour'),
                value: 'Jour',
                groupValue: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value as String?;
                  });
                },
              ),
              RadioListTile(
                title: Text('Nuit'),
                value: 'Nuit',
                groupValue: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value as String?;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _onSaveMode(mode);
                },
                child: Text("Enregistrer",style: TextStyle(
                    fontSize: 20
                ),),
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

  void _onSaveMode(String? mode) async {
    if (mode != null) {
      GlobalParams.themeActuel.setMode(mode);
    }
  }


}
