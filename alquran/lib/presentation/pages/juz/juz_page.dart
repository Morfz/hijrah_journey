import 'package:alquran/presentation/pages/juz/juz_detail_page.dart';
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
  final subtitles = ["Al-Fatihah (1) | Al-Baqarah (141)", "Al-Baqarah (142) | Al-Baqarah (256)", "Al-Baqarah (257) | Ali 'Imran (92)", "Ali 'Imran (93) | An-Nisa' (23)", "An-Nisa' (24) | An-Nisa' (147)", "An-Nisa' (148) | Al-Ma'idah (81)", "Al-Ma'idah (82) | Al-An'am (110)", "Al-An'am (111) | Al-A'raf (87)", "Al-A'raf (87) | Al-Anfal (40)", "Al-Anfal (41) | At-Taubah (92)",
                    "At-Taubah (92) | Hud (5)", "Hud (6) | Yusuf (52)", "Yusuf (53) | Ibrahim (52)", "Al-Hijr (1) | An-Nahl (128)", "Al-Isra' (1) | Al-Kahf (74)", "Al-Kahf (75) | Taha (135)", "Al-Anbiya' (1) | Al-Hajj (78)", "Al-Mu'minun (1) | Al-Furqan (20)", "Al-Furqan (21) | An-Naml (55)", "An-Naml (56) | Al-'Ankabut (45)",
                    "Al-'Ankabut (46) | Al-Ahzab (30)", "Al-Ahzab (31) | Yasin (27)", "Yasin (28) | Az-Zumar (31)", "Az-Zumar (32) | Fussilat (46)", "Fussilat (47) | Al-Jasiyah (37)", "Al-Ahqaf (1) | Az-Zariyat (30)", "Az-Zariyat (31) | Al-Hadid (29)", "Al-Mujadalah (1) | At-Tahrim (12)", "Al-Mulk (1) | Al-Mursalat (50)", "An-Naba'(1) | An-Nas (6)"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greenColor5,
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => JuzDetailPage(id: index+1)
                    )
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Card(
                      color: greenColor5,
                      elevation: 0.0,
                      child: ListTile(
                        dense: true,
                        // leading: Container(
                        //   width: 36,
                        //   height: 30,
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.rectangle,
                        //     borderRadius: BorderRadius.circular(8),
                        //     color: greenColor4,
                        //   ),
                        //   child: Text(
                        //     '${index+1}',
                        //     style: openSansMedium.copyWith(
                        //       fontSize: 16,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                        title: Text(
                          titles[index],
                          style: openSansNormal.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          subtitles[index],
                          style: openSansNormal.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
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
