import 'package:flutter/material.dart';
import 'dart:ui';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 45.0),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390,
                height: 250,
                alignment: Alignment.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Login as a Rider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Brand Bold",
                  fontSize: 45,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: _myDecorationTaxi('e-mail'),
              ),
              SizedBox(
                height: 34,
              ),
              TextField(
                obscureText: true,
                decoration: _myDecorationTaxi("password"),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _myDecorationTaxi(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontFamily: "Brand-Regular",
        color: Colors.yellow,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.yellow),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.yellow),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.yellow),
      ),
    );
  }
}
