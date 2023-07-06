import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimaryColor = Color(0xFFFF9407);
  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 22, color: Colors.black),
        headline4: TextStyle(fontSize: 28, color: Colors.black),
        subtitle2: TextStyle(fontSize: 14, color: Colors.black),
      ),
      primaryColor: lightPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
          iconColor: lightPrimaryColor,
          focusColor: lightPrimaryColor,
          labelStyle: TextStyle(color: lightPrimaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightPrimaryColor))),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.amber,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          )));
}
