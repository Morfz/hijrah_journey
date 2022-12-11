import 'package:equatable/equatable.dart';

class SurahDetail extends Equatable {
  SurahDetail({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  int? number;
  int? sequence;
  int? numberOfVerses;
  NameSurah? name;
  RevelationSurahDetail? revelation;
  DataTafsir? tafsir;
  PreBismillahSurahDetail? preBismillah;
  List<VerseSurah>? verses;

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

class NameSurah extends Equatable {
  NameSurah({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  TranslationSurahDetail? transliteration;
  TranslationSurahDetail? translation;

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}

class TranslationSurahDetail extends Equatable {
  TranslationSurahDetail({
    this.en,
    this.id,
  });

  String? en;
  String? id;

  @override
  List<Object?> get props => [en, id];
}

class PreBismillahSurahDetail extends Equatable {
  PreBismillahSurahDetail({
    this.text,
    this.translation,
    this.audio,
  });

  TextSurahDetail? text;
  TranslationSurahDetail? translation;
  AudioSurahDetail? audio;

  @override
  List<Object?> get props => [
        text,
        translation,
        audio,
      ];
}

class AudioSurahDetail extends Equatable {
  AudioSurahDetail({
    this.primary,
    this.secondary,
  });

  String? primary;
  List<String>? secondary;

  @override
  List<Object?> get props => [
        primary,
        secondary,
      ];
}

class TextSurahDetail extends Equatable {
  TextSurahDetail({
    this.arab,
    this.transliteration,
  });

  String? arab;
  TransliterationSurahDetail? transliteration;

  @override
  List<Object?> get props => [
        arab,
        transliteration,
      ];
}

class TransliterationSurahDetail extends Equatable {
  TransliterationSurahDetail({
    this.en,
  });

  String? en;

  @override
  List<Object?> get props => [en];
}

class RevelationSurahDetail extends Equatable {
  RevelationSurahDetail({
    this.arab,
    this.en,
    this.id,
  });

  String? arab;
  String? en;
  String? id;

  @override
  List<Object?> get props => [arab, en, id];
}

class DataTafsir extends Equatable {
  DataTafsir({
    this.id,
  });

  String? id;

  @override
  List<Object?> get props => [id];
}

class VerseSurah extends Equatable {
  VerseSurah({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  NumberSurahDetail? number;
  MetaSurahDetail? meta;
  TextSurahDetail? text;
  TranslationSurahDetail? translation;
  AudioSurahDetail? audio;
  VerseTafsir? tafsir;

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

class MetaSurahDetail extends Equatable {
  MetaSurahDetail({
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

  @override
  List<Object?> get props => [recommended, obligatory];
}

class NumberSurahDetail extends Equatable {
  NumberSurahDetail({
    this.inQuran,
    this.inSurah,
  });

  int? inQuran;
  int? inSurah;

  @override
  List<Object?> get props => [inQuran, inSurah];
}

class VerseTafsir extends Equatable {
  VerseTafsir({
    this.id,
  });

  Id? id;

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

  @override
  List<Object?> get props => [short, long];
}
