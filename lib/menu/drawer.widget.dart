import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyDarwer extends StatelessWidget {
  late SharedPreferences prefs;
  MyDarwer({Key? key}):super (key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.white,Colors.cyan])),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/dorra.jpg"),
                  radius: 80,
                ),
              )
          ),
          ListTile(
              title: Text(
                'Accueil',style: TextStyle(fontSize: 22),
              ),
              leading: Icon(Icons.home,color: Colors.cyan),
              trailing: Icon(Icons.arrow_right,color: Colors.cyan),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home");
              }
          ),
          ListTile(
            title: Text(
              'Météo',style: TextStyle(fontSize: 22),
            ),
            leading: Icon(Icons.sunny,color: Colors.cyan),
            trailing: Icon(Icons.arrow_right,color: Colors.cyan),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "/meteo");
            },
          ),
          ListTile(
            title: Text(
              'Galerie',style: TextStyle(fontSize: 22),
            ),
            leading: Icon(Icons.photo,color: Colors.cyan),
            trailing: Icon(Icons.arrow_right,color: Colors.cyan),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "/gallerie");
            },
          ),
          ListTile(
              title: Text(
                'Pays',style: TextStyle(fontSize: 22),
              ),
              leading: Icon(Icons.location_city,color: Colors.cyan),
              trailing: Icon(Icons.arrow_right,color: Colors.cyan),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, "/pays");
              }
          ),
          ListTile(
              title: Text(
                'Contact',style: TextStyle(fontSize: 22),
              ),
              leading: Icon(Icons.contact_phone,color: Colors.cyan),
              trailing: Icon(Icons.arrow_right,color: Colors.cyan),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, "/contact");
              }
          ),
          ListTile(
              title: Text(
                'Paramètres',style: TextStyle(fontSize: 22),
              ),
              leading: Icon(Icons.settings,color: Colors.cyan),
              trailing: Icon(Icons.arrow_right,color: Colors.cyan),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, "/parametre");
              }
          ),
          ListTile(
              title: Text(
                'Déconnexion',style: TextStyle(fontSize: 22),
              ),
              leading: Icon(Icons.logout,color: Colors.cyan),
              trailing: Icon(Icons.arrow_right,color: Colors.cyan),
              onTap: (){
                _Deconnexion(context);
              }
          ),


        ],
      ),
    );
  }
  Future<void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.pushNamedAndRemoveUntil(
        context, '/authentification', (route) => false);
  }
}
