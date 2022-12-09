import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final int numberOfVerse;
  final NameSurah nameSurah;
  final TransliterationSurah transliterationSurah;
  final TranslationSurah translation;

  const Surah({
    required this.number,
    required this.numberOfVerse,
    required this.nameSurah,
    required this.transliterationSurah,
    required this.translation,
  });

  @override
  List<Object?> get props => [
        number,
        numberOfVerse,
        nameSurah,
        transliterationSurah,
        translation,
      ];
}

class NameSurah extends Equatable {
  final String short;

  const NameSurah(this.short);

  @override
  List<Object?> get props => [short];
}

class TransliterationSurah extends Equatable {
  final String id;

  const TransliterationSurah(this.id);

  @override
  List<Object?> get props => [id];
}

class TranslationSurah extends Equatable {
  final String id;

  const TranslationSurah(this.id);
  @override
  List<Object?> get props => [id];
}
