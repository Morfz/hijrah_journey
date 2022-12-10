import 'dart:async';

import 'package:addon/presentation/widget/kiblat_widget.dart';
import 'package:addon/presentation/widget/kiblat_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:core/core.dart';

class KiblatPage extends StatefulWidget {
  const KiblatPage({super.key});

  @override
  State<KiblatPage> createState() => _KiblatPageState();
}

class _KiblatPageState extends State<KiblatPage> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          'Arah Kiblat',
          style: openSansMedium,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            } else if (snapshot.data?.enabled == true) {
              switch (snapshot.data?.status ?? false) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return KiblatWidget();
                case LocationPermission.denied:
                  return KiblatErrorWidget(
                    error: "Layanan lokasi ditolak",
                    callback: _checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return KiblatErrorWidget(
                    error: "Layanan lokasi ditolak Selamanya!",
                    callback: _checkLocationStatus,
                  );
                default:
                  return Container();
              }
            } else {
              return KiblatErrorWidget(
                error: "Harap aktifkan layanan Lokasi",
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ),
    );
  }
}
