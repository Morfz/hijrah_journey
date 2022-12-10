import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sholat/presentation/providers/harian_waktu_sholat_provider.dart';
import 'package:intl/intl.dart';

class CardJadwalSholatHarian extends StatefulWidget {
  const CardJadwalSholatHarian({
    Key? key,
  }) : super(key: key);

  @override
  State<CardJadwalSholatHarian> createState() => _CardJadwalSholatHarianState();
}

class _CardJadwalSholatHarianState extends State<CardJadwalSholatHarian> {
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
              var date = state.status.praytimes.keys.toList();
              var list = state.status.praytimes.values.toList();
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.location_on,
                          size: 18.0,
                          color: Colors.black,
                        ),
                        Text(
                          state.status.location,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat("MMMM").format(DateTime.now()),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.status.praytimes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ExpansionTile(
                                    initiallyExpanded: index == state.days,
                                    title: Text(
                                      date[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10),
                                                      child: Center(
                                                        child: Text(
                                                          "Subuh",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        list[index].fajr,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10),
                                                      child: Center(
                                                        child: Text(
                                                          "Terbit",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        list[index].sunrise,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10),
                                                      child: Center(
                                                        child: Text(
                                                          "Dzuhur",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        list[index].dhuhr,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10),
                                                      child: Center(
                                                        child: Text(
                                                          "Ashar",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        list[index].asr,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10),
                                                      child: Center(
                                                        child: Text(
                                                          "Magrib",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        list[index].maghrib,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10),
                                                      child: Center(
                                                        child: Text(
                                                          "Isya",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        list[index].ishaA,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        }),
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
