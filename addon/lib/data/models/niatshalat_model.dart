import 'dart:convert';

class NiatShalat {
  final String index;
  final String name;
  final String arabic;
  final String latin;
  final String terjemahan;

  NiatShalat({
    required this.index,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
  });

  factory NiatShalat.fromJson(Map<String, dynamic> niatshalat) => NiatShalat(
    index: niatshalat['index'],
    name: niatshalat['name'],
    arabic: niatshalat['arabic'],
    latin: niatshalat['latin'],
    terjemahan: niatshalat['terjemahan'],
  );
}

List<NiatShalat> parseNiatShalat(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => NiatShalat.fromJson(json)).toList();
}