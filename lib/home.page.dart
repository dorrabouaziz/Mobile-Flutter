import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu/drawer.widget.dart';
class Home extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDarwer(),
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
        body: Center(
            child: Wrap(
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
                      Navigator.pushNamed(context, "/authentification");
                    },
                  ),
                ]
            )
        )
    );
  }
}





