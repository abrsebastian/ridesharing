import 'package:flutter/material.dart';
import 'dart:ui';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.amberAccent]),
        ),
        child: Padding(
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
                SizedBox(height: 50),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: _myDecorationTaxi('e-mail'),
                ),
                SizedBox(height: 25,),
                TextField(
                  obscureText: true,
                  decoration: _myDecorationTaxi("password"),
                ),
                SizedBox(height: 50,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0,3),
                          )
                        ]),
                  child:Center(
                    child: Text('Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black
                    ),),
                  ),),
                SizedBox(height: 25,),
                TextButton(onPressed: (){},
                    child: Text('Do not have an accout? Register here',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                    ),))
              ],
            ),
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
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.amberAccent),
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.3));
  }
}
