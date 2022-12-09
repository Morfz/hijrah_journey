import 'package:fpdart/fpdart.dart';
import 'package:core/core.dart';
import 'package:alquran/domain/repositories/alquran_repository.dart';

import '../entities/surah_detail.dart';

class GetSurahDetail {
  final AlquranRepository repository;

  GetSurahDetail(this.repository);

  Future<Either<Failure, SurahDetail>> execute(int id) {
    return repository.getSurahDetail(id);
  }
}
