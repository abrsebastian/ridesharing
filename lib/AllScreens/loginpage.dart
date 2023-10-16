import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:ridesharing_personal/AllScreens/registrationscreen.dart';
import 'package:ridesharing_personal/generic/my_decorations.dart';
import 'package:ridesharing_personal/main.dart';

import 'mainscreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "/login";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield('e-mail'),
                ),
                SizedBox(height: 25,),
                TextField(
                  controller: passwordTextEditingController,
                  obscureText: true,
                  decoration: MyDecorations.myCustomTextfield('password'),
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    if (passwordTextEditingController.text.length < 6) {
                      displayToastMessage(
                          "Password must be atleast 6 characters", context);
                    }
                    else{
                      loginAndAuthenticateUser(context);
                    }
                  }, 
                  child: Container(
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
                ),
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loginAndAuthenticateUser(BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        print("User ID: ${firebaseUser.uid}");
        DatabaseEvent snap = await usersRefs.child(firebaseUser.uid).once();
        print("Snapshot: $snap");
        if (snap != null && snap.snapshot.value != null) {
          Navigator.popAndPushNamed(context, MainScreen.idScreen);
          displayToastMessage("You are logged-in now", context);
        } else {
          print("User not found in database");
          _firebaseAuth.signOut();
          displayToastMessage("No records exist for this user. Please create a new account", context);
        }
      } else {
        displayToastMessage("New user account has not been created", context);
      }
    } catch (e) {
      if (!isEmailValid(emailTextEditingController.text)) {
        displayToastMessage("Email address is not valid", context);
        return;
      }
      displayToastMessage("Error: $e", context);
      rethrow;
    }
  }

}
