import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hadist/data/datasources/hadist_remote_data_source.dart';
import 'package:hadist/data/repositories/hadist_repository_impl.dart';
import 'package:hadist/domain/repositories/hadist_repository.dart';
import 'package:hadist/domain/usecase/get_rawi.dart';
import 'package:hadist/domain/usecase/get_list_hadist.dart';
import 'package:hadist/presentation/bloc/rawi/rawi_bloc.dart';
import 'package:hadist/presentation/bloc/list_hadist/list_hadist_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // repository
  locator.registerLazySingleton<SurahRepository>(
    () => SurahRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<SurahRemoteDataSource>(
    () => SurahRemoteDataSourceImpl(locator()),
  );

  // bloc
  locator.registerLazySingleton<SurahBloc>(
    () => SurahBloc(locator()),
  );
  locator.registerLazySingleton<SurahDetailBloc>(
    () => SurahDetailBloc(locator()),
  );

  // usecase
  locator.registerLazySingleton<GetSurah>(() => GetSurah(locator()));
  locator
      .registerLazySingleton<GetSurahDetail>(() => GetSurahDetail(locator()));

  // helper
  locator.registerLazySingleton<Dio>(() => Dio());
}
