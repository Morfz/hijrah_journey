import 'package:hijrah_journey/models/waktu_sholat.dart';
import 'package:hijrah_journey/models/wilayah_sholat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WaktuSholatApiService {
  static const String _baseUrl = 'https://api.myquran.com/v1/';
  static const String _getHarianJadwal = 'sholat/jadwal/1301/2022/12/01';
  static const String _getWilayahByName = '/sholat/kota/cari/';

  Future<WaktuSholat> harianWaktuSholat() async {
    final response = await http.get(Uri.parse("$_baseUrl$_getHarianJadwal"));
    if (response.statusCode == 200) {
      return WaktuSholat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Waktu Sholat');
    }
  }

  Future<WilayahSholat> getWilayahByName(query) async {
    final response =
        await http.get(Uri.parse("$_baseUrl$_getWilayahByName$query"));
    if (response.statusCode == 200) {
      return WilayahSholat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Wilayah');
    }
  }
}
