import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:voyage/authentification.page.dart';
import 'package:voyage/config/global.params.dart';
import 'package:voyage/contact.page.dart';
import 'package:voyage/gallerie.page.dart';
import 'package:voyage/home.page.dart';
import 'package:voyage/meteo.page.dart';
import 'package:voyage/parametre.page.dart';
import 'package:voyage/pays.page.dart';

import 'firebase_options.dart';
import 'inscription.page.dart';

ThemeData theme = ThemeData.light();

FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GlobalParams.themeActuel.setMode(await _onGetMode());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final routes = {
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => Authentification(),
    '/home': (context) => Home(),
    '/meteo': (context) => Meteo(),
    '/parametre': (context) => Parametres(),
    '/gallerie': (context) => Gallerie(),
    '/contact': (context) => ContactPage(),
    '/pays': (context) => Pays(),
  };

  @override
  void initState() {
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(

      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: GlobalParams.themeActuel.getTheme(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData && snapshot.data != null) {
            return Home();
          } else {
            return Authentification();
          }
        },
      ),
    );
  }
}

Future<String> _onGetMode() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await ref.child('utilisateurs').child(user.uid).child('mode').get();
      if (snapshot.exists) {
        return snapshot.value.toString().toUpperCase();
      }
    }
    // Si le snapshot n'existe pas ou si l'utilisateur est null, retournez 'JOUR' par défaut
    return 'JOUR';
  } catch (e) {
    print('Erreur lors de la récupération du mode: $e');
    // En cas d'erreur, retournez 'JOUR' par défaut
    return 'JOUR';
  }
}
