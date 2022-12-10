import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:core/core.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  _QuranPageState createState() => _QuranPageState();
}
class _QuranPageState extends State<QuranPage>{

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
                Navigator.pushNamed(context, SURAH_PAGE);
              },
              child: const Text('Al-Quran Per Surah'),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, JUZ_PAGE);
              },
              child: const Text('Al-Quran Per Juz'),
            ),
          ],
        ),
      ),
    );
  }
}
