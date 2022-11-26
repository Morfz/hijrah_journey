import 'package:flutter/material.dart';
import 'package:hijrah_journey/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF4CA86E),
      ),
      title: 'HijrahApp',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HijrahHomePage(),
      },
    );
  }
}
