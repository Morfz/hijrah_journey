import 'package:equatable/equatable.dart';

class JuzDetail extends Equatable{
  JuzDetail({
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
  List<VerseJuz>? verses;

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

class VerseJuz extends Equatable{
  VerseJuz({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  NumberJuzDetail? number;
  MetaJuzDetail? meta;
  TextJuzDetail? text;
  TranslationJuzDetail? translation;
  AudioJuzDetail? audio;
  VerseTafsir? tafsir;

  @override
  List<Object?> get props => [
    number,
    meta,
    text,
    translation,
    audio,
    tafsir
  ];

}

class AudioJuzDetail extends Equatable{
  AudioJuzDetail({
    this.primary,
    this.secondary,
  });

  String? primary;
  List<String>? secondary;

  @override
  List<Object?> get props => [
    primary,
    secondary
  ];

}

class MetaJuzDetail extends Equatable{
  MetaJuzDetail({
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
    sajda
  ];

}

class Sajda extends Equatable{
  Sajda({
    this.recommended,
    this.obligatory,
  });

  bool? recommended;
  bool? obligatory;

  @override
  List<Object?> get props => [
    recommended,
    obligatory
  ];

}

class NumberJuzDetail extends Equatable{
  NumberJuzDetail({
    this.inQuran,
    this.inSurah,
  });

  int? inQuran;
  int? inSurah;

  @override
  List<Object?> get props => [
    inQuran,
    inSurah
  ];

}

class VerseTafsir extends Equatable{
  VerseTafsir({
    this.id,
  });

  Id? id;

  @override
  List<Object?> get props => [
    id
  ];

}

class Id extends Equatable{
  Id({
    this.short,
    this.long,
  });

  String? short;
  String? long;

  @override
  List<Object?> get props => [
    short,
    long
  ];

}

class TextJuzDetail extends Equatable{
  TextJuzDetail({
    this.arab,
    this.transliteration,
  });

  String? arab;
  TransliterationJuzDetail? transliteration;

  @override
  List<Object?> get props => [
    arab,
    transliteration
  ];

}

class TransliterationJuzDetail extends Equatable{
  TransliterationJuzDetail({
    this.en,
  });

  String? en;

  @override
  List<Object?> get props => [
    en
  ];

}

class TranslationJuzDetail extends Equatable{
  TranslationJuzDetail({
    this.en,
    this.id,
  });

  String? en;
  String? id;

  @override
  List<Object?> get props => [
    en,
    id
  ];

}
