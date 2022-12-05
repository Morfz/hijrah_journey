import 'package:fpdart/fpdart.dart';

import '../../common/failure.dart';
import '../entities/rawi.dart';
import '../repositories/hadist_repository.dart';

class GetSurah {
  final SurahRepository repository;

  GetSurah(this.repository);

  Future<Either<Failure, List<Rawi>>> execute() {
    return repository.getRawi();
  }
}
