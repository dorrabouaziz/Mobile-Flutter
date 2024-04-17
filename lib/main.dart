import 'package:flutter/material.dart';
import 'package:voyage/authentification.page.dart';
import 'package:voyage/contact.page.dart';
import 'package:voyage/gallerie.page.dart';
import 'package:voyage/home.page.dart';
import 'package:voyage/meteo.page.dart';
import 'package:voyage/parametre.page.dart';
import 'package:voyage/pays.page.dart';

import 'inscription.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

final routes={
  '/inscription':(context)=>InscriptionPage(),
  '/authentification':(context)=>Authentification(),
  '/home':(context)=>Home(),
  '/meteo':(context)=>Meteo(),
  '/parametre':(context)=>Parametre(),
  '/gallerie': (context)=>Gallerie(),
  '/contact':(context)=>Contact(),
  '/pays':(context)=>Pays(),



};
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home:Authentification(),
    );
  }
}