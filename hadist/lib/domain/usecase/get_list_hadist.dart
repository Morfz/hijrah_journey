import 'package:core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hadist/domain/repositories/hadist_repository.dart';

import '../entities/list_hadist.dart';

class GetListHadist {
  final HadistRepository repository;

  GetListHadist(this.repository);

  Future<Either<Failure, ListHadist>> execute(String id) {
    return repository.getListHadist(id);
  }
}
