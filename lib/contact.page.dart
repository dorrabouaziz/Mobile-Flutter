import 'package:flutter/material.dart';
class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Page",
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
              image: AssetImage('assets/contact.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}