import 'package:flutter/material.dart';

class WilayahSholatView extends StatelessWidget {
  const WilayahSholatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Pilih Wilayah'),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 20.0,
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
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: SizedBox(
                    width: 200,
                    child: Center(
                      child: Text(
                        'widget.restaurant.name',
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor)),
                    onPressed: () {},
                    child: const Text('Pilih'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
