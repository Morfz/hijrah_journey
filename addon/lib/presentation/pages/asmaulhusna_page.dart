import 'package:addon/data/models/asmaulhusna_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AsmaulHusnaPage extends StatelessWidget {
  static const routeName = '/asmaulhusna-page';

  const AsmaulHusnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Card(
            color: kBackgroundColor,
            elevation: 0.0,
            child: ListTile(
              leading: Container(
                width: 36,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: greenColor4,
                ),
                child: Text(
                  asmaulHusna.index,
                  style: openSansMedium.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              title: Text(
                asmaulHusna.latin,
                style: openSansNormal.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                asmaulHusna.translation_id,
                style: openSansNormal.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: Text(
                  asmaulHusna.arabic,
                  textAlign: TextAlign.right,
                  style: arabicFont.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
      ]
    );
  }
}