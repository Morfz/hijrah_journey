import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:core/core.dart';

class HijrahHomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HijrahHomePageState createState() => _HijrahHomePageState();
}

class _HijrahHomePageState extends State<HijrahHomePage> with RouteAware {

  User? _user = FirebaseAuth.instance.currentUser;

  String _displayName() {
    if (_user?.displayName == null) {
      return '';
    } else {
      return _user!.displayName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var menu = [
      {
        "nama": "Al-Qur'an",
        "deskripsi": "Fitur Membaca Al-Qur'an",
        "pict": "assets/quran.png",
        "routes": "",
      },
      {
        "nama": "Hadist",
        "deskripsi": "Fitur Hadist",
        "pict": "assets/tasbih.png",
        "routes": "/hadist-page",
      },
      {
        "nama": "Waktu Sholat",
        "deskripsi": "Fitur Notifikasi Sholat dan Melihat waktu sholat",
        "pict": "assets/sujud.png",
        "routes": "/waktu-sholat",
      }
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Hijrah Journey App'),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 20.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (_user != null) {
                    Navigator.of(context).pushNamed(PROFIL_PAGE);
                  } else {
                    Navigator.of(context).pushNamed(LOGIN_PAGE);
                  }
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Text('Assalamualaikum ${_displayName()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            Expanded(
                child: CardHomeMenu(menu: menu)),
          ],
        ));
  }
}
