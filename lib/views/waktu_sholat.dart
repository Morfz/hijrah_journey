import 'package:flutter/material.dart';

class WaktuSholatView extends StatelessWidget {
  const WaktuSholatView({super.key});

  @override
  Widget build(BuildContext context) {
    var waktu = {
      "location": "Klaten, Indonesia",
      "praytimes": {
        "Fajr": "03:51",
        "Sunrise": "05:06",
        "Dhuhr": "11:24",
        "Asr": "14:38",
        "Maghrib": "17:36",
        "Isha'a": "18:47"
      },
    };

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text('Waktu Sholat'),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: SizedBox(
                          width: 150,
                          child: Center(
                            child: Text(
                              "Praytimes",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                waktu["praytimes"]!.toString(),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
