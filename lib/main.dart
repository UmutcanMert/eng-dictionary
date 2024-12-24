import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/english_page.dart';
import 'package:flutter_application_1/pages/german_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';
import 'package:flutter_application_1/pages/turkish_page.dart';
import 'package:provider/provider.dart';
import "package:flutter_application_1/pages/about_page.dart";
import "package:flutter_application_1/pages/help_page.dart";
import 'themes/theme_provider.dart';
// because we using material UI 

// void main() {
//   runApp(const MyApp());
// }
void main(){
  runApp(
    ChangeNotifierProvider( // edited pubspec.yaml file for this library
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
      // Routes
      routes: {
        '/homepage': (context) => const HomePage(),
        '/englishpage': (context) => const EnglishPage(),
        '/turkishpage': (context) => const TurkishPage(),
        '/germanpage': (context) => const GermanPage(),
        '/settingspage': (context) => const SettingsPage(),
        '/aboutpage': (context) => const AboutPage(),
        '/helppage': (context) => const HelpPage(),
      },
    );
  }
}

