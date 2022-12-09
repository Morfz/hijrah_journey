import 'package:fpdart/fpdart.dart';
import 'package:core/core.dart';
import 'package:alquran/domain/entities/juz_detail.dart';
import 'package:alquran/domain/repositories/alquran_repository.dart';

class GetJuzDetail {
  final AlquranRepository repository;

  GetJuzDetail(this.repository);

  Future<Either<Failure, JuzDetail>> execute(int id) {
    return repository.getJuzDetail(id);
  }
}
