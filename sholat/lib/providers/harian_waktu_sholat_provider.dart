import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sholat/api/api_waktu_sholat.dart';
import 'package:core/core.dart';

import '../models/waktu_sholat.dart';

class HarianJadwalSholatProvider extends ChangeNotifier {
  final WaktuSholatApiService apiService;

  HarianJadwalSholatProvider({required this.apiService}) {
    _fetchHarianJadwalSholat();
  }

  late WaktuSholat _waktuSholatStatus;
  late ResultState _state;
  String _message = '';

  WaktuSholat get list => _waktuSholatStatus;
  ResultState get state => _state;
  String get message => _message;

  Future _fetchHarianJadwalSholat() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final waktuSholat = await apiService.harianWaktuSholat();
      if (waktuSholat.status == false) {
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
