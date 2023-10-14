import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ridesharing_personal/AllScreens/mainscreen.dart';
import 'package:ridesharing_personal/main.dart';
import 'dart:ui';
import '../generic/my_decorations.dart';
import 'loginpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "registrater";
  
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context){
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
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield('name'),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield("e-mail"),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.white),
                  decoration: MyDecorations.myCustomTextfield("phone"),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: passwordTextEditingController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: MyDecorations.myCustomTextfield("password"),
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    if(nameTextEditingController.text.length < 3){
                      displayToastMessage("Name must be atleast 3 characters.", context);
                    }
                 /*   else if(emailTextEditingController.text.contains("@")){
                      displayToastMessage("Email address is not valid", context);
                    }*/
                    else if(phoneTextEditingController.text.isEmpty){
                      displayToastMessage("Phone number is mandatory", context);
                    }
                    else if(passwordTextEditingController.text.length < 6){
                      displayToastMessage("Password must be atleast 6 characters", context);
                    }
                    else{
                      registerNewUser(context);
                    }
                  },
                  child: Container(
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
                ),
                SizedBox(height: 25,),
                TextButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
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
  }


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerNewUser(BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {


        Map userDataMap = {
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
          "password": passwordTextEditingController.text.trim(),
        };
        usersRefs.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Congratulations, your account has been created", context);

        Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);

      } else {
        displayToastMessage("New user account has not been created", context);
        // Manejar el error
      }
    } catch (e) {
      if(!isEmailValid(emailTextEditingController.text)){
        displayToastMessage("Email address is not valid", context);
        return;
      }
      // Manejo de errores
      displayToastMessage("Error" + e.toString(), context);
    }
  }

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$');
    return emailRegExp.hasMatch(email);
  }
}

displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}