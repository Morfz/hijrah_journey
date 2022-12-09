import 'package:addon/data/datasources/doa_remote_data_source.dart';
import 'package:addon/data/repositories/doa_repository_impl.dart';
import 'package:addon/domain/repositories/doa_repository.dart';
import 'package:addon/domain/usecase/get_doa.dart';
import 'package:addon/presentation/bloc/doa/doa_bloc.dart';
import 'package:alquran/data/datasources/alquran_remote_data_source.dart';
import 'package:alquran/data/repositories/alquran_repository_impl.dart';
import 'package:alquran/domain/repositories/alquran_repository.dart';
import 'package:alquran/domain/usecase/get_juz_detail.dart';
import 'package:alquran/domain/usecase/get_surah.dart';
import 'package:alquran/domain/usecase/get_surah_detail.dart';
import 'package:alquran/presentation/bloc/juz_detail/juz_detail_bloc.dart';
import 'package:alquran/presentation/bloc/surah/surah_bloc.dart';
import 'package:alquran/presentation/bloc/surah_detail/surah_detail_bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
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
          () => HadistRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<DoaRepository>(
          () => DoaRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<AlquranRepository>(
          () => AlquranRepositoryImpl(remoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<HadistRemoteDataSource>(
          () => HadistRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<DoaRemoteDataSource>(
          () => DoaRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<AlquranRemoteDataSource>(
          () => AlquranRemoteDataSourceImpl(locator()));

  // bloc
  locator.registerLazySingleton<RawiBloc>(
          () => RawiBloc(locator()));
  locator.registerLazySingleton<ListHadistBloc>(
          () => ListHadistBloc(locator()));
  locator.registerLazySingleton<DoaBloc>(
          () => DoaBloc(locator()));
  locator.registerLazySingleton<SurahBloc>(
          () => SurahBloc(locator()));
  locator.registerLazySingleton<SurahDetailBloc>(
          () => SurahDetailBloc(locator()));
  locator.registerLazySingleton<JuzDetailBloc>(
          () => JuzDetailBloc(locator()));

  // usecase
  locator.registerLazySingleton<GetRawi>(
          () => GetRawi(locator()));
  locator.registerLazySingleton<GetListHadist>(
          () => GetListHadist(locator()));
  locator.registerLazySingleton(
          () => GetDoa(locator()));
  locator.registerLazySingleton(
          () => GetSurah(locator()));
  locator.registerLazySingleton(
          () => GetSurahDetail(locator()));
  locator.registerLazySingleton(
          () => GetJuzDetail(locator()));

  // helper
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton(() => http.Client());
}
