import 'package:fpdart/fpdart.dart';
import 'package:core/core.dart';
import 'package:alquran/domain/entities/juz_detail.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/entities/surah_detail.dart';

abstract class AlquranRepository {
  Future<Either<Failure, List<Surah>>> getSurah();
  Future<Either<Failure, SurahDetail>> getSurahDetail(int id);
  Future<Either<Failure, JuzDetail>> getJuzDetail(int id);
}
