import 'package:flutter/material.dart';

class HijrahHomePage extends StatelessWidget {
  static const routeName = '/home';
  const HijrahHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var menu = [
      {
        "nama": "Al-Qur'an",
        "deskripsi": "Lorem Ipsum",
        "pict": "",
      },
      {
        "nama": "Hadist",
        "deskripsi": "Lorem Ipsum",
        "pict": "",
      },
      {
        "nama": "Waktu Sholat",
        "deskripsi": "Lorem Ipsum",
        "pict": "",
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
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: (MediaQuery.of(context).size.width) * 1 / 2,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38, spreadRadius: 2),
                              ],
                              image: const DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                    'https://restaurant-api.dicoding.dev/images/small/restaurant.pictureId'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: SizedBox(
                              width: 150,
                              child: Center(
                                child: Text(
                                  menu[index]["nama"]!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: SizedBox(
                              width: 200,
                              height: 20,
                              child: Center(
                                child: Text(
                                  'restaurant.description',
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Theme.of(context).primaryColor)),
                              onPressed: null,
                              child: const Text('Selengkapnya...'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
