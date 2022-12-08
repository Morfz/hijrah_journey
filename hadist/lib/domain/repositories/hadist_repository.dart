import 'package:core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/domain/entities/rawi.dart';

abstract class HadistRepository {
  Future<Either<Failure, List<Rawi>>> getRawi();
  Future<Either<Failure, ListHadist>> getListHadist(String id);
}
