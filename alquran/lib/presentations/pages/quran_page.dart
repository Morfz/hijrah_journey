import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Masih dalam tahap pengembangan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
    );
  }
}