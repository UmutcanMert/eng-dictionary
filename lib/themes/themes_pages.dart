import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900]!,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20)
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
  )
);

ThemeData lightMode = ThemeData(
   brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 72, 99, 182),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey[300]!,
    primary: const Color.fromARGB(255, 72, 99, 182),
    secondary: Colors.black,
  )
);