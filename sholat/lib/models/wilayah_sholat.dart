// To parse this JSON data, do
//
//     final wilayahSholat = wilayahSholatFromJson(jsonString);

import 'dart:convert';

WilayahSholat wilayahSholatFromJson(String str) =>
    WilayahSholat.fromJson(json.decode(str));

String wilayahSholatToJson(WilayahSholat data) => json.encode(data.toJson());

class WilayahSholat {
  WilayahSholat({
    required this.status,
    required this.data,
  });

  final bool status;
  final List<Datum> data;

  factory WilayahSholat.fromJson(Map<String, dynamic> json) => WilayahSholat(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.lokasi,
  });

  final String id;
  final String lokasi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        lokasi: json["lokasi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
      };
}
