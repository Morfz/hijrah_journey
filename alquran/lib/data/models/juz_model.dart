import 'package:equatable/equatable.dart';
import 'package:alquran/domain/entities/juz_detail.dart';

class JuzDetailModel extends Equatable {
  JuzDetailModel({
    this.juz,
    this.juzStartSurahNumber,
    this.juzEndSurahNumber,
    this.juzStartInfo,
    this.juzEndInfo,
    this.totalVerses,
    this.verses,
  });

  int? juz;
  int? juzStartSurahNumber;
  int? juzEndSurahNumber;
  String? juzStartInfo;
  String? juzEndInfo;
  int? totalVerses;
  final List<VerseSurahDetailModel>? verses;

  factory JuzDetailModel.fromJson(Map<String, dynamic> json) =>
      JuzDetailModel(
        juz: json["juz"],
        juzStartSurahNumber: json["juzStartSurahNumber"],
        juzEndSurahNumber: json["juzEndSurahNumber"],
        juzStartInfo: json["juzStartInfo"],
        juzEndInfo: json["juzEndInfo"],
        totalVerses: json["totalVerses"],
        verses: List<VerseSurahDetailModel>.from(
          json["verses"].map(
                (x) => VerseSurahDetailModel.fromJson(x),
          ),
        ),
      );

  JuzDetail toEntity() {
    return JuzDetail(
      juz: juz ?? -1,
      juzStartInfo: juzStartInfo ?? "",
      juzEndInfo: juzEndInfo ?? "",
      verses: verses
          ?.map(
            (e) => VerseJuz(
          number: NumberJuzDetail(
            inSurah: e.number?.inSurah ?? -1,
          ),
          text: TextJuzDetail(
            arab: e.text?.arab ?? "",
            transliteration: TransliterationJuzDetail(
              en: e.text?.transliteration?.en ?? "",
            ),
          ),
          translation: TranslationJuzDetail(
            id: e.translation?.id ?? "",
          ),
          audio: AudioJuzDetail(
            primary: e.audio?.primary ?? "",
          ),
          meta: MetaJuzDetail(
            juz: e.meta?.juz ?? -1,
          ),
        ),
      )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    juz,
    juzStartSurahNumber,
    juzEndSurahNumber,
    juzStartInfo,
    juzEndInfo,
    totalVerses,
    verses
  ];
}

class NameModel extends Equatable {
  NameModel({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
    short: json["short"],
    long: json["long"],
    transliteration: json["transliteration"] != null
        ? Translation.fromJson(json["transliteration"])
        : null,
    translation: Translation.fromJson(json["translation"]),
  );

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

  @override
  List<Object?> get props => [en, id];
}

class PreBismillah extends Equatable {
  PreBismillah({
    this.text,
    this.translation,
    this.audio,
  });

  Text? text;
  Translation? translation;
  Audio? audio;

  factory PreBismillah.fromJson(Map<String, dynamic> json) => PreBismillah(
    text: Text.fromJson(json["text"]),
    translation: Translation.fromJson(json["translation"]),
    audio: Audio.fromJson(json["audio"]),
  );

  @override
  List<Object?> get props => [
    text,
    translation,
    audio,
  ];
}

class Audio extends Equatable {
  Audio({
    this.primary,
    this.secondary,
  });

  String? primary;
  List<String>? secondary;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    primary: json["primary"],
    secondary: List<String>.from(json["secondary"].map((x) => x)),
  );

  @override
  List<Object?> get props => [
    primary,
    secondary,
  ];
}

class Text extends Equatable {
  Text({
    this.arab,
    this.transliteration,
  });

  String? arab;
  Transliteration? transliteration;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
    arab: json["arab"],
    transliteration: Transliteration.fromJson(json["transliteration"]),
  );

  @override
  List<Object?> get props => [
    arab,
    transliteration,
  ];
}

class Transliteration extends Equatable {
  Transliteration({
    this.en,
  });

  String? en;

  factory Transliteration.fromJson(Map<String, dynamic> json) =>
      Transliteration(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
    "en": en,
  };

  @override
  List<Object?> get props => [en];
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
  List<Object?> get props => [arab, en, id];
}

class DataTafsir extends Equatable {
  DataTafsir({
    this.id,
  });

  String? id;

  factory DataTafsir.fromJson(Map<String, dynamic> json) => DataTafsir(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };

  @override
  List<Object?> get props => [id];
}

class VerseSurahDetailModel extends Equatable {
  VerseSurahDetailModel({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  Number? number;
  Meta? meta;
  Text? text;
  Translation? translation;
  Audio? audio;
  VerseTafsir? tafsir;

  factory VerseSurahDetailModel.fromJson(Map<String, dynamic> json) =>
      VerseSurahDetailModel(
        number: Number.fromJson(json["number"]),
        meta: Meta.fromJson(json["meta"]),
        text: Text.fromJson(json["text"]),
        translation: Translation.fromJson(json["translation"]),
        audio: Audio.fromJson(json["audio"]),
        tafsir: VerseTafsir.fromJson(json["tafsir"]),
      );

  @override
  List<Object?> get props => [
    number,
    meta,
    text,
    translation,
    audio,
    tafsir,
  ];
}

class Meta extends Equatable {
  Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  int? juz;
  int? page;
  int? manzil;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    juz: json["juz"],
    page: json["page"],
    manzil: json["manzil"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: Sajda.fromJson(json["sajda"]),
  );

  @override
  List<Object?> get props => [
    juz,
    page,
    manzil,
    ruku,
    hizbQuarter,
    sajda,
  ];
}

class Sajda extends Equatable {
  Sajda({
    this.recommended,
    this.obligatory,
  });

  bool? recommended;
  bool? obligatory;

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );

  @override
  List<Object?> get props => [recommended, obligatory];
}

class Number extends Equatable {
  Number({
    this.inQuran,
    this.inSurah,
  });

  int? inQuran;
  int? inSurah;

  factory Number.fromJson(Map<String, dynamic> json) => Number(
    inQuran: json["inQuran"],
    inSurah: json["inSurah"],
  );

  @override
  List<Object?> get props => [inQuran, inSurah];
}

class VerseTafsir extends Equatable {
  VerseTafsir({
    this.id,
  });

  Id? id;

  factory VerseTafsir.fromJson(Map<String, dynamic> json) => VerseTafsir(
    id: Id.fromJson(json["id"]),
  );

  @override
  List<Object?> get props => [id];
}

class Id extends Equatable {
  Id({
    this.short,
    this.long,
  });

  String? short;
  String? long;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    short: json["short"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "short": short,
    "long": long,
  };

  @override
  List<Object?> get props => [short, long];
}
