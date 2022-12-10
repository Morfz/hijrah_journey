import 'package:alquran/presentation/pages/home/quran_page.dart';
import 'package:core/core.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hadist/presentation/pages/rawi_page.dart';
import 'package:user/presentation/pages/profile_page.dart';

import 'dashboard_page.dart';

class HijrahHomePage extends StatefulWidget {
  static const routeName = '/home';

  const HijrahHomePage({super.key});

  @override
  State createState() => _HijrahHomePageState();
}

class _HijrahHomePageState extends State<HijrahHomePage>{
  Widget? _child;

  @override
  void initState() {
    _child = const PageMain();
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
              backgroundColor: kPrimaryColor,
              extras: {'label': 'Home'},
            ),
            FluidNavBarIcon(
              icon: Icons.menu_book_rounded,
              backgroundColor: kPrimaryColor,
              extras: {'label': 'Al-Quran'},
            ),
            FluidNavBarIcon(
              icon: Icons.library_books_rounded,
              backgroundColor: kPrimaryColor,
              extras: {'label': 'Hadist'},
            ),
            FluidNavBarIcon(
              icon: Icons.person,
              backgroundColor: kPrimaryColor,
              extras: {'label': 'Profile'},
            ),
          ],
          onChange: _handleNavigationChange,
          style: const FluidNavBarStyle(
              iconUnselectedForegroundColor: Colors.white54,
          iconSelectedForegroundColor: Colors.white,
          barBackgroundColor: kPrimaryColor),
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
          _child = const PageMain();
          break;
        case 1:
          _child = QuranPage();
          break;
        case 2:
          _child = const RawiPage();
          break;
        case 3:
          _child = const ProfilePage();
          break;
      }
      _child = AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: _child);
    });
  }
}
