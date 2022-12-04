import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:core/presentation/pages/home_page.dart';
import 'package:hijrah_journey/views/wilayah_sholat.dart';
import 'package:user/presentation/pages/login_page.dart';

import 'firebase_options.dart';
import 'views/waktu_sholat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider()
  ]);
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
      title: 'Hijrah Journey App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HijrahHomePage(),

        //page waktu sholat
        '/waktu-sholat': (context) => const WaktuSholatView(),
        '/wilayah-sholat': (context) => const WilayahSholatView(),

        //login
        '/login': (context) => const HijrahLoginPage(),
      },
    );
  }
}
