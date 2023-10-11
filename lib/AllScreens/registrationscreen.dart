import 'package:flutter/material.dart';
import 'dart:ui';
import '../generic/my_decorations.dart';
import 'loginpage.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context
      ) {
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
                  'Register as a Rider',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Brand Bold",
                    fontSize: 45,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield('name'),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield("e-mail"),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield("phone"),
                ),
                SizedBox(height: 10,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: MyDecorations.myCustomTextfield("password"),
                ),
                SizedBox(height: 50,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: MyDecorations.gradientButtonDecoration(),
                  child:Center(
                    child: Text('Create Account',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black
                      ),),
                  ),),
                SizedBox(height: 25,),
                TextButton(onPressed: (){
                  Navigator.pop(
                      context,
                      MaterialPageRoute(builder:(context)=>LoginScreen()));
                },
                    child: Text('Already have an account? Login here',
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
  }}