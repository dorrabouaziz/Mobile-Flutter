import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu/drawer.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.cyan,
          elevation: 0,
        ),
        drawer: MyDarwer(),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<User?>(
                  future: FirebaseAuth.instance.authStateChanges().first,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Text(
                        'Welcome User', // Si l'utilisateur n'est pas connecté, affiche 'Welcome User'
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    User? user = snapshot.data;
                    if(user != null && user.email != null) {
                      return Text(
                        'Welcome ${user.email}', // Utilise l'email comme nom d'utilisateur
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return Text(
                        'Welcome User',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: 20),
                Wrap(
                    children: [
                      InkWell(
                        child: Ink.image(
                          height: 180,
                          width: 180,
                          image: AssetImage(
                              'assets/meteo.png'
                          ),),
                        onTap: () {
                          Navigator.pushNamed(context, "/meteo");
                        },
                      ),
                      InkWell(
                        child: Ink.image(
                          height: 180,
                          width: 180,
                          image: AssetImage(
                              'assets/gallerie.png'
                          ),),
                        onTap: () {
                          Navigator.pushNamed(context, "/gallerie");
                        },
                      ),
                      InkWell(
                        child: Ink.image(
                          height: 180,
                          width: 180,
                          image: AssetImage(
                              'assets/pays.png'
                          ),),
                        onTap: () {
                          Navigator.pushNamed(context, "/pays");
                        },
                      ),
                      InkWell(
                        child: Ink.image(
                          height: 180,
                          width: 180,
                          image: AssetImage(
                              'assets/contact.png'
                          ),),
                        onTap: () {
                          Navigator.pushNamed(context, "/contact");
                        },
                      ),
                      InkWell(
                        child: Ink.image(
                          height: 180,
                          width: 180,
                          image: AssetImage(
                              'assets/parametres.png'
                          ),),
                        onTap: () {
                          Navigator.pushNamed(context, "/parametre");
                        },
                      ),
                      InkWell(
                        child: Ink.image(
                          height: 180,
                          width: 180,
                          image: AssetImage(
                              'assets/deconnexion.png'
                          ),),
                        onTap: () {
                          _Deconnexion(context);
                        },
                      ),
                    ]
                )
              ],
            )
        )
    );
  }
  Future<void> _Deconnexion(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Rediriger l'utilisateur vers la page d'authentification
      Navigator.pushNamedAndRemoveUntil(
          context, '/authentification', (route) => false);
    } catch (e) {
      print("Erreur lors de la déconnexion : $e");
      // Traitez l'erreur, par exemple afficher un message à l'utilisateur
    }
  }
}


