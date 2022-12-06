import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:hadist/domain/entities/rawi.dart';
import 'package:hadist/common/failure.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/domain/repositories/hadist_repository.dart';

import '../../common/exception.dart';
import '../datasources/hadist_remote_data_source.dart';

class HadistRepositoryImpl extends HadistRepository {
  final HadistRemoteDataSource remoteDataSource;

  HadistRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Rawi>>> getRawi() async {
    try {
      final result = await remoteDataSource.getRawi();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListHadist>> getListHadist(String id) async {
    try {
      final result = await remoteDataSource.getListHadist(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
