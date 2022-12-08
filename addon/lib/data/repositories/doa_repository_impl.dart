import 'dart:io';

import 'package:addon/data/datasources/doa_remote_data_source.dart';
import 'package:addon/domain/entities/doa.dart';
import 'package:addon/domain/repositories/doa_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class DoaRepositoryImpl implements DoaRepository {
  final DoaRemoteDataSource doaRemoteDataSource;

  DoaRepositoryImpl({
    required this.doaRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Doa>>> getDoaList() async {
    try {
      final result = await doaRemoteDataSource.getDoaList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
