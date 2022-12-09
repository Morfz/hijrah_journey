import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:alquran/domain/entities/juz_detail.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/entities/surah_detail.dart';
import 'package:alquran/domain/repositories/alquran_repository.dart';
import 'package:core/core.dart';

import '../datasources/alquran_remote_data_source.dart';

class AlquranRepositoryImpl extends AlquranRepository {
  final AlquranRemoteDataSource remoteDataSource;

  AlquranRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurah() async {
    try {
      final result = await remoteDataSource.getSurah();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, SurahDetail>> getSurahDetail(int id) async {
    try {
      final result = await remoteDataSource.getSurahDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, JuzDetail>> getJuzDetail(int id) async {
    try {
      final result = await remoteDataSource.getJuzDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
