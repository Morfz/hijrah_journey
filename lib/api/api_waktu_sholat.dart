import 'package:hijrah_journey/models/waktu_sholat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WaktuSholatApiService {
  static const String _baseUrl =
      'https://api.myquran.com/v1/sholat/jadwal/1301/2022/12/01';

  Future<WaktuSholat> harianWaktuSholat() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return WaktuSholat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Restaurant');
    }
  }
}
