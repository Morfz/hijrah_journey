import 'package:alquran/presentations/pages/quran_page.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:core/core.dart';
import 'package:hadist/presentation/pages/rawi_page.dart';
import 'package:user/presentation/pages/profile_page.dart';

import 'dashboard_page.dart';

class HijrahHomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  State createState() => _HijrahHomePageState();
}

class _HijrahHomePageState extends State<HijrahHomePage> with RouteAware {
  Widget? _child;

  @override
  void initState() {
    _child = PageMain();
    super.initState();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
              icon: Icons.home,
              backgroundColor: Colors.white,
              extras: {'label': 'Home'},
            ),
            FluidNavBarIcon(
              icon: Icons.menu_book_rounded,
              backgroundColor: Colors.white,
              extras: {'label': 'Al-Quran'},
            ),
            FluidNavBarIcon(
              icon: Icons.library_books_rounded,
              backgroundColor: Colors.white,
              extras: {'label': 'Hadist'},
            ),
            FluidNavBarIcon(
              icon: Icons.person,
              backgroundColor: Colors.white,
              extras: {'label': 'Profile'},
            ),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.black),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!['label'],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = PageMain();
          break;
        case 1:
          _child = QuranPage();
          break;
        case 2:
          _child = RawiPage();
          break;
        case 3:
          _child = ProfilePage();
          break;
      }
      _child = AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: _child);
    });
  }

// @override
// Widget build(BuildContext context) {
//   var menu = [
//     {
//       "nama": "Al-Qur'an",
//       "deskripsi": "Fitur Membaca Al-Qur'an",
//       "pict": "assets/quran.png",
//       "routes": "",
//     },
//     {
//       "nama": "Hadist",
//       "deskripsi": "Fitur Hadist",
//       "pict": "assets/tasbih.png",
//       "routes": "/hadist-page",
//     },
//     {
//       "nama": "Waktu Sholat",
//       "deskripsi": "Fitur Notifikasi Sholat dan Melihat waktu sholat",
//       "pict": "assets/sujud.png",
//       "routes": "/waktu-sholat",
//     }
//   ];
//
//   return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             const Text('Hijrah Journey App'),
//             IconButton(
//               icon: const Icon(
//                 Icons.person,
//                 size: 20.0,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 if (_user != null) {
//                   Navigator.of(context).pushNamed(PROFIL_PAGE);
//                 } else {
//                   Navigator.of(context).pushNamed(LOGIN_PAGE);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//               padding: const EdgeInsets.all(20),
//               child: Text('Assalamualaikum ${_displayName()}',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold))),
//           Expanded(
//               child: CardHomeMenu(menu: menu)),
//         ],
//       ));
// }
}
