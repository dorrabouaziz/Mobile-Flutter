import 'package:flutter/material.dart';
class Pays extends StatelessWidget {
  const Pays({super.key});
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
      body: Center(
        child: Container(

          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pays.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}