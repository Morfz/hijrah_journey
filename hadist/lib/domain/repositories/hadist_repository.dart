import 'package:fpdart/fpdart.dart';
import 'package:hadist/common/failure.dart';
import 'package:hadist/domain/entities/rawi.dart';
import 'package:hadist/domain/entities/list_hadist.dart';

abstract class SurahRepository {
  Future<Either<Failure, List<Rawi>>> getRawi();
  Future<Either<Failure, ListHadist>> getListHadist(String id);
}
