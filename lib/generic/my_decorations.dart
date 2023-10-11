import 'package:flutter/material.dart';

class MyDecorations {
  static Decoration blackAndYellowDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.amberAccent]),
    );
  }

  static InputDecoration myCustomTextfield(String hintText) {
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

  static BoxDecoration gradientButtonDecoration() {
    return BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]);
  }
}
