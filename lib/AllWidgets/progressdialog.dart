import 'package:flutter/material.dart';
import 'package:ridesharing_personal/generic/my_decorations.dart';

class ProgressDialog extends StatelessWidget {
  String message;

  ProgressDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow,
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding:EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 6.0,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
              SizedBox(width: 25.0,),
              Text(message,
              style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}