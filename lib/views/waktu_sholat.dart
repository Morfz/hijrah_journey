import 'package:flutter/material.dart';
import 'package:hijrah_journey/api/api_waktu_sholat.dart';
import 'package:hijrah_journey/providers/harian_waktu_sholat_provider.dart';
import 'package:provider/provider.dart';

import '../utility/result_state.dart';

class WaktuSholatView extends StatelessWidget {
  const WaktuSholatView({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) =>
          HarianJadwalSholatProvider(apiService: WaktuSholatApiService()),
      child: Scaffold(
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
                child: Consumer<HarianJadwalSholatProvider>(
                    builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.hasData) {
                    return Card(
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
                                    "Waktu Sholat ",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.lokasi,
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: <Widget>[
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: SizedBox(
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              "Subuh",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 10),
                                        child: SizedBox(
                                          width: 200,
                                          child: Center(
                                            child: Text(
                                              state.list.data.jadwal.subuh,
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
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
              ))),
    );
  }
}
