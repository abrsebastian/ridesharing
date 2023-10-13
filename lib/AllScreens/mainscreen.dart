import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const String idScreen = "mainscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      body: Container(),
    );
  }
}