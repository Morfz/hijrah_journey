import 'package:addon/data/models/niatshalat_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NiatShalatPage extends StatelessWidget {
  static const routeName = '/niatshalat-page';

  const NiatShalatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Niat Shalat'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/data/niatshalat.json'),
        builder: (context, snapshot) {
          final List<NiatShalat> niatshalat = parseNiatShalat(snapshot.data);
          return ListView.builder(
              itemCount: niatshalat.length,
              itemBuilder: (context, index) {
                return _buildNiatShalatItem(context, niatshalat[index]);
              });
        },
      ),
    );
  }

  Widget _buildNiatShalatItem(BuildContext context, NiatShalat niatShalat) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          margin: const EdgeInsets.all(5),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                niatShalat.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                niatShalat.arabic,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                niatShalat.latin,
                                style: const TextStyle(
                                    fontSize: 16, fontStyle: FontStyle.italic),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 5),
                              child: Text(niatShalat.terjemahan,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
