import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hadist/data/datasources/hadist_remote_data_source.dart';
import 'package:hadist/data/repositories/hadist_repository_impl.dart';
import 'package:hadist/domain/repositories/hadist_repository.dart';
import 'package:hadist/domain/usecase/get_list_hadist.dart';
import 'package:hadist/domain/usecase/get_rawi.dart';
import 'package:hadist/presentation/bloc/list_hadist/list_hadist_bloc.dart';
import 'package:hadist/presentation/bloc/rawi/rawi_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // repository
  locator.registerLazySingleton<HadistRepository>(
    () => HadistRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<HadistRemoteDataSource>(
    () => HadistRemoteDataSourceImpl(locator()),
  );

  // bloc
  locator.registerLazySingleton<RawiBloc>(
    () => RawiBloc(locator()),
  );
  locator.registerLazySingleton<ListHadistBloc>(
    () => ListHadistBloc(locator()),
  );

  // usecase
  locator.registerLazySingleton<GetRawi>(() => GetRawi(locator()));
  locator
      .registerLazySingleton<GetListHadist>(() => GetListHadist(locator()));

  // helper
  locator.registerLazySingleton<Dio>(() => Dio());
}
