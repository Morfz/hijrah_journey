import 'package:flutter/material.dart';

import 'package:core/presentation/widgets/card_home_menu.dart';

class HijrahHomePage extends StatelessWidget {
  static const routeName = '/home';
  const HijrahHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var menu = [
      {
        "nama": "Al-Qur'an",
        "deskripsi": "Fitur Membaca Al-Qur'an",
        "pict": "",
        "routes": "",
      },
      {
        "nama": "Hadist",
        "deskripsi": "Fitur Hadist",
        "pict": "",
        "routes": "",
      },
      {
        "nama": "Waktu Sholat",
        "deskripsi": "Fitur Notifikasi Sholat dan Melihat waktu sholat",
        "pict": "",
        "routes": "",
      }
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('HijrahApp'),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/search_resto');
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: CardHomeMenu(menu: menu),
        ));
  }
}
