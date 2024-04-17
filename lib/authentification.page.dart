import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentification extends StatelessWidget {
  late SharedPreferences prefs;

  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Authentification",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: txt_login,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Identifiant",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: txt_password,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      _onAuthentifier(context);
                    },
                    child: Text("Connexion"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/inscription');
                  },
                  child: Text("Nouvel Utilisateur"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
    String psw = prefs.getString("password") ?? '';

    prefs.setBool("connecte", true);
    if (txt_login.text == log && txt_password.text == psw) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vérifier votre Id ou votre mot de passe'),
        ),
      );
    }
  }
}
