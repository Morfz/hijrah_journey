import 'package:addon/domain/entities/doa.dart';
import 'package:addon/domain/repositories/doa_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetDoaList {
  final DoaRepository doaRepository;

  GetDoaList(this.doaRepository);

  Future<Either<Failure, List<Doa>>> execute() {
    return doaRepository.getDoaList();
  }
}
