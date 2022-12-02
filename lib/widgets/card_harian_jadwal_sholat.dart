import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/harian_waktu_sholat_provider.dart';
import '../utility/result_state.dart';

class CardJadwalSholatHarian extends StatefulWidget {
  const CardJadwalSholatHarian({
    Key? key,
  }) : super(key: key);

  @override
  State<CardJadwalSholatHarian> createState() => _CardJadwalSholatHarianState();
}

class _CardJadwalSholatHarianState extends State<CardJadwalSholatHarian> {
  static const String idWilayahPrefs = 'idWilayah';
  late String _idWilayah;

  void _loadIdWilayah() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _idWilayah = prefs.getString(idWilayahPrefs) ?? "1301";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadIdWilayah();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<HarianJadwalSholatProvider>(
              builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
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
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: SizedBox(
                          width: 200,
                          child: Center(
                            child: Text(
                              _idWilayah,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: Center(
                          child: Text(
                            state.list.data.jadwal.tanggal,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Imsak",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.imsak,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Terbit",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.terbit,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Dhuha",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.dhuha,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Dzuhur",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.dzuhur,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Ashar",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.ashar,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Maghrib",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.maghrib,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
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
                                      "Isya",
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      state.list.data.jadwal.isya,
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
        ));
  }
}
