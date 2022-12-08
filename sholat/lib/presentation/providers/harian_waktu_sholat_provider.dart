import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sholat/data/api/api_waktu_sholat.dart';
import 'package:intl/intl.dart';
import '../../data/models/waktu_sholat.dart';

class HarianJadwalSholatProvider extends ChangeNotifier {
  final WaktuSholatApiService apiService;

  HarianJadwalSholatProvider({required this.apiService}) {
    _fetchHarianJadwalSholat();
    _days();
  }

  late WaktuSholat _waktuSholatStatus;
  late ResultState _state;
  String _message = '';

  WaktuSholat get status => _waktuSholatStatus;
  ResultState get state => _state;
  String get message => _message;
  int get days => _days();

  int _days() {
    final now = DateTime.now();
    final formatter = DateFormat('d');
    final formatted = formatter.format(now);
    return int.parse(formatted) + 1;
  }

  Future _fetchHarianJadwalSholat() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final waktuSholat = await apiService.jadwalWaktuSholat();
      if (waktuSholat.praytimes.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _waktuSholatStatus = waktuSholat;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } on HttpException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Couldn't find the post";
    } on FormatException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Bad response format";
    }
  }
}
