import 'package:addon/domain/entities/doa.dart';
import 'package:addon/domain/repositories/doa_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetDoa {
  final DoaRepository repository;

  GetDoa(this.repository);

  Future<Either<Failure, List<Doa>>> execute() {
    return repository.getDoa();
  }
}
