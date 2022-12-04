import 'package:flutter/material.dart';
import 'package:hijrah_journey/api/api_waktu_sholat.dart';
import 'package:hijrah_journey/providers/harian_waktu_sholat_provider.dart';
import 'package:hijrah_journey/widgets/card_harian_jadwal_sholat.dart';
import 'package:provider/provider.dart';


class WaktuSholatPage extends StatelessWidget {
  const WaktuSholatPage({super.key});

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
              children: <Widget>[
                const Text('Waktu Sholat'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.location_on,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/wilayah-sholat');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: const CardJadwalSholatHarian()),
    );
  }
}
