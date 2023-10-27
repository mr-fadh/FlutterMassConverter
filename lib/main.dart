import 'package:flutter/material.dart';
import 'pages/mass_convert.dart';
import 'pages/intro_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/massconverter' :(context) => const MassConverter(),
        '/intropage' : (context) => const IntroPage(),
      },

    );
  }
}