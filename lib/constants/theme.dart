import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primarySwatch: Colors.red,
    useMaterial3: true,
    primaryColor: Colors.red.shade500,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.red, // Set the icon color to white
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black)),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide(color: Colors.black26),
            textStyle: const TextStyle(color: Colors.black))),

    ///input
    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.red.shade500,
        suffixIconColor: Colors.grey,
        enabledBorder: OutlineInputBorder(),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 18,
            ),
            disabledBackgroundColor: Colors.grey,
            backgroundColor: Colors.red)));
