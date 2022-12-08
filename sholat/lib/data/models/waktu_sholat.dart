// To parse this JSON data, do
//
//     final waktuSholat = waktuSholatFromJson(jsonString);


import 'dart:convert';

WaktuSholat waktuSholatFromJson(String str) => WaktuSholat.fromJson(json.decode(str));

String waktuSholatToJson(WaktuSholat data) => json.encode(data.toJson());

class WaktuSholat {
    WaktuSholat({
        required this.location,
        required this.calculationMethod,
        required this.asrjuristicMethod,
        required this.praytimes,
    });

    final String location;
    final String calculationMethod;
    final String asrjuristicMethod;
    final Map<String, Praytime> praytimes;

    factory WaktuSholat.fromJson(Map<String, dynamic> json) => WaktuSholat(
        location: json["location"],
        calculationMethod: json["calculationMethod"],
        asrjuristicMethod: json["asrjuristicMethod"],
        praytimes: Map.from(json["praytimes"]).map((k, v) => MapEntry<String, Praytime>(k, Praytime.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "calculationMethod": calculationMethod,
        "asrjuristicMethod": asrjuristicMethod,
        "praytimes": Map.from(praytimes).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Praytime {
    Praytime({
        required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.maghrib,
        required this.ishaA,
    });

    final String fajr;
    final String sunrise;
    final String dhuhr;
    final String asr;
    final String maghrib;
    final String ishaA;

    factory Praytime.fromJson(Map<String, dynamic> json) => Praytime(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        maghrib: json["Maghrib"],
        ishaA: json["Isha'a"],
    );

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Maghrib": maghrib,
        "Isha'a": ishaA,
    };
}
