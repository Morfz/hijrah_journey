import 'dart:convert';

class AsmaulHusna {
  final String index;
  final String latin;
  final String arabic;
  final String translation_id;
  final String translation_en;

  AsmaulHusna({
    required this.index,
    required this.latin,
    required this.arabic,
    required this.translation_id,
    required this.translation_en,
  });

  factory AsmaulHusna.fromJson(Map<String, dynamic> asmaulhusna) => AsmaulHusna(
    index: asmaulhusna['index'],
    latin: asmaulhusna['latin'],
    arabic: asmaulhusna['arabic'],
    translation_id: asmaulhusna['translation_id'],
    translation_en: asmaulhusna['translation_en'],
  );
}

List<AsmaulHusna> parseAsmaulHusna(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => AsmaulHusna.fromJson(json)).toList();
}