import 'package:flutter/material.dart';
import 'package:hijrah_journey/api/api_waktu_sholat.dart';
import 'package:hijrah_journey/providers/harian_waktu_sholat_provider.dart';
import 'package:hijrah_journey/widgets/card_harian_jadwal_sholat.dart';
import 'package:provider/provider.dart';

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
          body: const CardJadwalSholatHarian()),
    );
  }
}
