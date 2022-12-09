import 'package:flutter/material.dart';
import 'package:core/core.dart';

class JuzPage extends StatefulWidget {
  const JuzPage({super.key});

  @override
  State<JuzPage> createState() => _JuzPageState();
}

class _JuzPageState extends State<JuzPage> {
  final titles = ["Juz 1", "Juz 2", "Juz 3", "Juz 4", "Juz 5", "Juz 6", "Juz 7", "Juz 8", "Juz 9", "Juz 10",
                  "Juz 11", "Juz 12", "Juz 13", "Juz 14", "Juz 15", "Juz 16", "Juz 17", "Juz 18", "Juz 19", "Juz 20",
                  "Juz 21", "Juz 22", "Juz 23", "Juz 24", "Juz 25", "Juz 26", "Juz 27", "Juz 28", "Juz 29", "Juz 30"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Al-Quran',
          style: openSansMedium,
        ),
      ),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  JUZ_DETAIL_PAGE,
                  arguments: index+1,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Card(
                      elevation: 0.0,
                      child: ListTile(
                        dense: true,
                        minLeadingWidth: 5,
                        title: Text(
                          titles[index],
                          style: openSansNormal.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          }
      )
    );
  }
}
