import 'package:flutter/material.dart';
import 'package:hijrah_journey/providers/wilayah_sholat_provider.dart';
import 'package:provider/provider.dart';

import '../api/api_waktu_sholat.dart';
import '../utility/result_state.dart';

class WilayahSholatView extends StatefulWidget {
  const WilayahSholatView({super.key});

  @override
  State<WilayahSholatView> createState() => _WilayahSholatViewState();
}

class _WilayahSholatViewState extends State<WilayahSholatView> {
  late String query = "a";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WilayahSholatProvider(
          apiService: WaktuSholatApiService(), query: query),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title:
                Consumer<WilayahSholatProvider>(builder: (context, state, _) {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'Cari Wilayah',
                  icon: Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  state.runSearch(value);
                },
              );
            })),
        body: Consumer<WilayahSholatProvider>(builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.list.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  state.list.data[index].lokasi,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
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
                  );
                });
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        }),
      ),
    );
  }
}
