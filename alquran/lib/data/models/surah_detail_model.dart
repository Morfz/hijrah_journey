import 'package:equatable/equatable.dart';
import 'package:alquran/domain/entities/surah_detail.dart';

class SurahDetailModel extends Equatable {
  const SurahDetailModel({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final NameModel? name;
  final Revelation? revelation;
  final DataTafsir? tafsir;
  final PreBismillah? preBismillah;
  final List<VerseSurahDetailModel>? verses;

  factory SurahDetailModel.fromJson(Map<String, dynamic> json) =>
      SurahDetailModel(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameModel.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: DataTafsir.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"] != null
            ? PreBismillah.fromJson(json["preBismillah"])
            : null,
        verses: List<VerseSurahDetailModel>.from(
          json["verses"].map(
            (x) => VerseSurahDetailModel.fromJson(x),
          ),
        ),
      );

  SurahDetail toEntity() {
    return SurahDetail(
      number: number,
      numberOfVerses: numberOfVerses,
      preBismillah: PreBismillahSurahDetail(
        text: TextSurahDetail(
          arab: preBismillah?.text?.arab ?? "",
        ),
      ),
      name: NameSurah(
        short: name?.short ?? "",
        transliteration: TranslationSurahDetail(
          id: name?.transliteration?.id ?? "",
        ),
        translation: TranslationSurahDetail(
          id: name?.translation?.id ?? "",
        )
      ),
      revelation: RevelationSurahDetail(
        arab: revelation?.arab ?? "",
        id: revelation?.id ?? "",
      ),
      verses: verses
          ?.map(
            (e) => VerseSurah(
              number: NumberSurahDetail(
                inSurah: e.number?.inSurah ?? -1,
              ),
              text: TextSurahDetail(
                arab: e.text?.arab ?? "",
                transliteration: TransliterationSurahDetail(
                  en: e.text?.transliteration?.en ?? "",
                ),
              ),
              translation: TranslationSurahDetail(
                id: e.translation?.id ?? "",
              ),
              audio: AudioSurahDetail(
                primary: e.audio?.primary ?? "",
              ),
              meta: MetaSurahDetail(
                juz: e.meta?.juz ?? -1,
              ),
            ),
          )
          .toList(),
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
        preBismillah,
        verses,
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
