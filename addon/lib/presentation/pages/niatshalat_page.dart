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
        future: DefaultAssetBundle.of(context).loadString('assets/data/niatshalat.json'),
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
    return Card(
      child: Column(
        children: <Widget>[
          Text(niatShalat.name),
          Text(niatShalat.arabic, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(niatShalat.latin, style: const TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}