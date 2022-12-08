import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

import '../../data/api/api_waktu_sholat.dart';
import '../../data/models/wilayah_sholat.dart';

class WilayahSholatProvider extends ChangeNotifier {
  final WaktuSholatApiService apiService;
  String query;

  WilayahSholatProvider({required this.apiService, required this.query}) {
    _fetchAllWilayahSholat(query);
  }

  late WilayahSholat _wilayahSholatdata;
  late ResultState _state;
  String _message = '';

  WilayahSholat get list => _wilayahSholatdata;
  ResultState get state => _state;
  String get message => _message;

  runSearch(String query) {
    this.query = query;
    _fetchAllWilayahSholat(this.query);
    notifyListeners();
  }

  Future _fetchAllWilayahSholat(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final wilayahSholat = await apiService.getWilayahByName(query);
      if (wilayahSholat.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _wilayahSholatdata = wilayahSholat;
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
