import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sholat/data/api/api_waktu_sholat.dart';
import 'package:sholat/presentation/providers/harian_waktu_sholat_provider.dart';
import '../../common/notification.dart';
import 'package:core/core.dart';

class NotificationSettingsPages extends StatefulWidget {
  const NotificationSettingsPages({super.key});

  @override
  State<NotificationSettingsPages> createState() =>
      _NotificationSettingsPagesState();
}

class _NotificationSettingsPagesState extends State<NotificationSettingsPages> {
  bool isSubuh = false;
  bool isDzuhur = false;
  bool isAshar = false;
  bool isMaghrib = false;
  bool isIsya = false;
  late var isi;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            HarianJadwalSholatProvider(apiService: WaktuSholatApiService()),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text('Settings'),
            ),
            body: Consumer<HarianJadwalSholatProvider>(
                builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.hasData) {
                var list = state.status.praytimes.values.toList();
                return Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Waktu Subuh jam ${list[state.days].fajr}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  isSubuh
                                      ? "Notifikasi Aktif"
                                      : "Nitifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: isSubuh,
                                onChanged: (value) {
                                  setState(() {
                                    isSubuh = value;
                                    if (isSubuh == true) {
                                      final prayerTime = list[state.days].fajr;
                                      isi =
                                          prayerTime.substring(0, 5).split(':');
                                      final hour = int.parse(isi[0]);
                                      final minute = int.parse(isi[1]);
                                      createWaktuSholatNotification(
                                        1,
                                        hour,
                                        minute,
                                        'Adzan Subuh!',
                                        'Selamat melaksanakan ibadah sholat Subuh',
                                      );
                                    } else {
                                      cancelWaktuSholatNotification(1);
                                    }
                                  });
                                })
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Waktu Dhuhur jam ${list[state.days].dhuhr}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  isDzuhur
                                      ? "Notifikasi Aktif"
                                      : "Nitifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: isDzuhur,
                                onChanged: (value) {
                                  setState(() {
                                    isDzuhur = value;
                                    if (isDzuhur == true) {
                                      final prayerTime = list[state.days].dhuhr;
                                      isi =
                                          prayerTime.substring(0, 5).split(':');
                                      final hour = int.parse(isi[0]);
                                      final minute = int.parse(isi[1]);
                                      createWaktuSholatNotification(
                                        2,
                                        hour,
                                        minute,
                                        'Adzan Dzuhur',
                                        'Selamat melaksanakan ibadah sholat Dzuhur',
                                      );
                                    } else {
                                      cancelWaktuSholatNotification(2);
                                    }
                                  });
                                })
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Waktu Ashar jam ${list[state.days].asr}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  isAshar
                                      ? "Notifikasi Aktif"
                                      : "Nitifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: isAshar,
                                onChanged: (value) {
                                  setState(() {
                                    isAshar = value;
                                    if (isAshar == true) {
                                      final prayerTime = list[state.days].asr;
                                      isi =
                                          prayerTime.substring(0, 5).split(':');
                                      final hour = int.parse(isi[0]);
                                      final minute = int.parse(isi[1]);
                                      createWaktuSholatNotification(
                                        3,
                                        hour,
                                        minute,
                                        'Adzan Ashar!',
                                        'Selamat melaksanakan ibadah sholat Ashar',
                                      );
                                    } else {
                                      cancelWaktuSholatNotification(3);
                                    }
                                  });
                                })
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Waktu Maghrib jam ${list[state.days].maghrib}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  isMaghrib
                                      ? "Notifikasi Aktif"
                                      : "Nitifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: isMaghrib,
                                onChanged: (value) {
                                  setState(() {
                                    isMaghrib = value;
                                    if (isMaghrib == true) {
                                      final prayerTime =
                                          list[state.days].maghrib;
                                      isi =
                                          prayerTime.substring(0, 5).split(':');
                                      final hour = int.parse(isi[0]);
                                      final minute = int.parse(isi[1]);
                                      createWaktuSholatNotification(
                                        4,
                                        hour,
                                        minute,
                                        'Adzan Maghrib!',
                                        'Selamat melaksanakan ibadah sholat Maghrib',
                                      );
                                    } else {
                                      cancelWaktuSholatNotification(4);
                                    }
                                  });
                                })
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Waktu Isya jam ${list[state.days].ishaA}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  isIsya
                                      ? "Notifikasi Aktif"
                                      : "Nitifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: isIsya,
                                onChanged: (value) {
                                  setState(() {
                                    isIsya = value;
                                    if (isIsya == true) {
                                      final prayerTime = list[state.days].ishaA;
                                      isi =
                                          prayerTime.substring(0, 5).split(':');
                                      final hour = int.parse(isi[0]);
                                      final minute = int.parse(isi[1]);
                                      createWaktuSholatNotification(
                                        5,
                                        hour,
                                        minute,
                                        'Adzan Subuh!',
                                        'Selamat melaksanakan ibadah sholat Subuh',
                                      );
                                    } else {
                                      cancelWaktuSholatNotification(5);
                                    }
                                  });
                                })
                          ],
                        )),
                  ],
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
            })));
  }
}
