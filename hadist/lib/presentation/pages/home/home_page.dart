import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../common/routes.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/hadist-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SURAH_ROUTE);
              },
              child: const Text('Al-Quran'),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ARAH_QIBLAT_ROUTE);
              },
              child: const Text('Qiblat'),
            ),
          ],
        ),
      ),
    );
  }
}
