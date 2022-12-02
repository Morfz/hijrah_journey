import 'package:flutter/material.dart';

class CardHomeMenu extends StatelessWidget {
  const CardHomeMenu({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final List<Map<String, String>> menu;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(menu[index]["pict"]!)),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: SizedBox(
                        width: 200,
                        child: Center(
                          child: Text(
                            menu[index]["deskripsi"]!,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
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
                        onPressed: () {
                          Navigator.pushNamed(context, menu[index]["routes"]!);
                        },
                        child: const Text('Pilih'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
