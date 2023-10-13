import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:ridesharing_personal/AllScreens/registrationscreen.dart';
import 'package:ridesharing_personal/generic/my_decorations.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyDecorations.blackAndYellowDecoration(),
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
                  decoration: MyDecorations.myCustomTextfield('e-mail'),
                ),
                SizedBox(height: 25,),
                TextField(
                  obscureText: true,
                  decoration: MyDecorations.myCustomTextfield('password'),
                ),
                SizedBox(height: 50,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: MyDecorations.gradientButtonDecoration(),
                  child:Center(
                    child: Text('Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black
                    ),),
                  ),),
                SizedBox(height: 25,),
                TextButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
                },
                    child: Text('Do not have an account? Register here',
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

}
