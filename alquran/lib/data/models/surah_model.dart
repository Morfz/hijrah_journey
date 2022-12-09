import 'package:equatable/equatable.dart';
import 'package:alquran/domain/entities/surah.dart';

class SurahModel extends Equatable {
  SurahModel({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    this.revelation,
    this.tafsir,
  });

  int? number;
  int? sequence;
  int? numberOfVerses;
  Name? name;
  Revelation? revelation;
  Tafsir? tafsir;

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name!.toJson(),
        "revelation": revelation!.toJson(),
        "tafsir": tafsir!.toJson(),
      };

  Surah toEntity() {
    return Surah(
      number: number ?? 0,
      numberOfVerse: numberOfVerses ?? 0,
      nameSurah: NameSurah(name?.short ?? ""),
      transliterationSurah:
          TransliterationSurah(name?.transliteration?.id ?? ""),
      translation: TranslationSurah(name?.translation?.id ?? ""),
    );
  }

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
      ];
}

class Name extends Equatable {
  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration!.toJson(),
        "translation": translation!.toJson(),
      };

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}

class Translation extends Equatable {
  Translation({
    this.en,
    this.id,
  });

  String? en;
  String? id;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };

  @override
  List<Object?> get props => [id, en];
}

class Revelation extends Equatable {
  Revelation({
    this.arab,
    this.en,
    this.id,
  });

  String? arab;
  String? en;
  String? id;

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };

  @override
  List<Object?> get props => [
        arab,
        en,
        id,
      ];
}

class Tafsir extends Equatable {
  Tafsir({
    this.id,
  });

  String? id;

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  @override
  List<Object?> get props => [
        id,
      ];
}
