import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sholat/data/models/waktu_sholat.dart';


class WaktuSholatApiService {
  static const String _baseUrl = 'https://muslim-pro-api-lleans.koyeb.app/';

  Future<WaktuSholat> jadwalWaktuSholat() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return WaktuSholat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Waktu Sholat');
    }
  }

}
