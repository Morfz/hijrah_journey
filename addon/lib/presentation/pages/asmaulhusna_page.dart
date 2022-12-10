import 'package:addon/data/models/asmaulhusna_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AsmaulHusnaPage extends StatelessWidget {
  static const routeName = '/asmaulhusna-page';

  const AsmaulHusnaPage({Key? key}) : super(key: key);

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
        title: const Text('Asmaul Husna'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/data/asmaulhusna.json'),
        builder: (context, snapshot) {
          final List<AsmaulHusna> asmaulHusna = parseAsmaulHusna(snapshot.data);
          return ListView.builder(
              itemCount: asmaulHusna.length,
              itemBuilder: (context, index) {
                return _buildAsmaulHusnaItem(context, asmaulHusna[index]);
              });
        },
      ),
    );
  }
  Widget _buildAsmaulHusnaItem(BuildContext context, AsmaulHusna asmaulHusna) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(asmaulHusna.arabic, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(asmaulHusna.latin, style: const TextStyle(fontStyle: FontStyle.italic)),
          Text(asmaulHusna.translation_id),
        ],
      ),
    );
  }
}