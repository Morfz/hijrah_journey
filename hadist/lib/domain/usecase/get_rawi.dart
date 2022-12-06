import 'package:fpdart/fpdart.dart';

import '../../common/failure.dart';
import '../entities/rawi.dart';
import '../repositories/hadist_repository.dart';

class GetRawi {
  final HadistRepository repository;

  GetRawi(this.repository);

  Future<Either<Failure, List<Rawi>>> execute() {
    return repository.getRawi();
  }
}
