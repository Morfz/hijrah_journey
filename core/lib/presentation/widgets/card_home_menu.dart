import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardHomeMenu extends StatelessWidget {
  CardHomeMenu({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final List<Map<String, String>> menu;
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(padding: const EdgeInsets.all(20),
            child: Text('Assalamualaikum, ${user.displayName}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            menu[index]['pict']!,
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            menu[index]['nama']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            menu[index]['deskripsi']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Theme.of(context).primaryColor)),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, menu[index]["routes"]!);
                              },
                              child: const Text('Pilih'),
                            ),
                          ),
                        ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
