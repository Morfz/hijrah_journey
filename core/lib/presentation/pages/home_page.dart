import 'package:alquran/presentations/pages/quran_page.dart';
import 'package:core/core.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hadist/presentation/pages/rawi_page.dart';
import 'package:user/presentation/pages/profile_page.dart';

import 'dashboard_page.dart';

class HijrahHomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  State createState() => _HijrahHomePageState();
}

class _HijrahHomePageState extends State<HijrahHomePage>{
  Widget? _child;

  @override
  void initState() {
    _child = PageMain();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
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
}
