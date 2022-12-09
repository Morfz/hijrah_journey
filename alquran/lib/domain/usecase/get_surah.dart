import 'package:core/core.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/repositories/alquran_repository.dart';
import 'package:fpdart/fpdart.dart';


class GetSurah {
  final AlquranRepository repository;

  GetSurah(this.repository);

  Future<Either<Failure, List<Surah>>> execute() {
    return repository.getSurah();
  }
}
