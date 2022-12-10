import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sholat/data/api/api_waktu_sholat.dart';
import 'package:sholat/presentation/providers/harian_waktu_sholat_provider.dart';
import 'package:sholat/presentation/widgets/card_harian_jadwal_sholat.dart';

class WaktuSholatPage extends StatelessWidget {
  const WaktuSholatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HarianJadwalSholatProvider(apiService: WaktuSholatApiService()),
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Waktu Sholat'),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/notification-settings-page');
                  },
                ),
              ],
            ),
          ),
          body: const CardJadwalSholatHarian()),
    );
  }
}
