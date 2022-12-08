import 'package:addon/domain/entities/doa.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class DoaRepository {
  Future<Either<Failure, List<Doa>>> getDoaList();
}
