import 'dart:io';

import 'package:addon/data/datasources/doa_remote_data_source.dart';
import 'package:addon/domain/entities/doa.dart';
import 'package:addon/domain/repositories/doa_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class DoaRepositoryImpl implements DoaRepository {
  final DoaRemoteDataSource remoteDataSource;

  DoaRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Doa>>> getDoa() async {
    try {
      final result = await remoteDataSource.getDoa();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
