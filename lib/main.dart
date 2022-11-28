import 'package:flutter/material.dart';
import 'package:core/presentation/pages/home_page.dart';

import 'views/waktu_sholat.dart';

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

        //page waktu sholat
        '/waktu-sholat': (context) => const WaktuSholatView(),
      },
    );
  }
}
