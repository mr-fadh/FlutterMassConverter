import 'package:flutter/material.dart';
import 'mass_convert.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Intro Page"),
      //   backgroundColor: Colors.grey[800],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Unit Converter',
              style: TextStyle(fontSize: 35),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MassConverter()));
              }, 
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[700],
              ),
              child: const Text("Convert Now!"),
            ),
          ],
        ),
      ),
    );
  }
}