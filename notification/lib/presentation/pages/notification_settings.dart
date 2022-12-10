import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late bool _isSubuh;
  late bool _isDzuhur;
  late bool _isAshar;
  late bool _isMaghrib;
  late bool _isIsya;
  late var isi;

  void _loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSubuh = prefs.getBool('notification-setting-1') ?? false;
      _isDzuhur = prefs.getBool('notification-setting-2') ?? false;
      _isAshar = prefs.getBool('notification-setting-3') ?? false;
      _isMaghrib = prefs.getBool('notification-setting-4') ?? false;
      _isIsya = prefs.getBool('notification-setting-5') ?? false;
    });
  }

  void _changeSetting(idNotif, trigger) async {
    final prefs = await SharedPreferences.getInstance();

    if (trigger) {
      prefs.setBool('notification-setting-$idNotif', true);
      trigger = prefs.getBool('notification-setting')!;
    } else {
      prefs.setBool('notification-setting-$idNotif', false);
      trigger = prefs.getBool('notification-setting$idNotif')!;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSetting();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                                  _isSubuh
                                      ? "Notifikasi Aktif"
                                      : "N0tifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: _isSubuh,
                                onChanged: (value) {
                                  setState(() {
                                    _isSubuh = value;
                                    if (_isSubuh == true) {
                                      final prayerTime = list[state.days].fajr;
                                      _changeSetting(1, _isSubuh);
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
                                      _changeSetting(1, _isSubuh);
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
                                  _isDzuhur
                                      ? "Notifikasi Aktif"
                                      : "Notifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: _isDzuhur,
                                onChanged: (value) {
                                  setState(() {
                                    _isDzuhur = value;
                                    if (_isDzuhur == true) {
                                      final prayerTime = list[state.days].dhuhr;
                                      _changeSetting(2, _isDzuhur);
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
                                      _changeSetting(2, _isDzuhur);
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
                                  _isAshar
                                      ? "Notifikasi Aktif"
                                      : "Notifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: _isAshar,
                                onChanged: (value) {
                                  setState(() {
                                    _isAshar = value;
                                    if (_isAshar == true) {
                                      final prayerTime = list[state.days].asr;
                                      _changeSetting(3, _isDzuhur);
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
                                      _changeSetting(3, _isDzuhur);
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
                                  _isMaghrib
                                      ? "Notifikasi Aktif"
                                      : "Notifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: _isMaghrib,
                                onChanged: (value) {
                                  setState(() {
                                    _isMaghrib = value;
                                    if (_isMaghrib == true) {
                                      final prayerTime =
                                          list[state.days].maghrib;
                                      _changeSetting(4, _isMaghrib);
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
                                      _changeSetting(4, _isMaghrib);
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
                                  _isIsya
                                      ? "Notifikasi Aktif"
                                      : "Notifikasi tidak aktif",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                                value: _isIsya,
                                onChanged: (value) {
                                  setState(() {
                                    _isIsya = value;
                                    if (_isIsya == true) {
                                      final prayerTime = list[state.days].ishaA;
                                      _changeSetting(5, _isIsya);
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
                                      _changeSetting(5, _isIsya);
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
