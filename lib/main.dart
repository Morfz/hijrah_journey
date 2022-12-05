import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:hadist/presentation/pages/home/home_page.dart';
import 'package:hijrah_journey/views/wilayah_sholat.dart';
import 'package:user/presentation/pages/login_page.dart';
import 'package:user/presentation/pages/profile_page.dart';

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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF4CA86E),
      ),
      title: 'Hijrah Journey App',
      home: HijrahHomePage(),
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case HOME_PAGE:
            return MaterialPageRoute(builder: (context) => HijrahHomePage());
          case LOGIN_PAGE:
            return MaterialPageRoute(builder: (context) => const HijrahLoginPage());
          case PROFIL_PAGE:
            return MaterialPageRoute(builder: (context) => const ProfilePage());
          case HADIST_PAGE:
            return MaterialPageRoute(builder: (context) => const HadistPage());
          case WAKTU_SHOLAT_PAGE:
            return MaterialPageRoute(builder: (context) => const WaktuSholatPage());
          case WILAYAH_SHOLAT_PAGE:
            return MaterialPageRoute(builder: (context) => const WilayahSholatPage());
          default:
            return MaterialPageRoute(builder: (context) => HijrahHomePage());
        }
      },
    );
  }
}
