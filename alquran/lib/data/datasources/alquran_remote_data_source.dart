import 'package:dio/dio.dart';
import 'package:core/core.dart';
import 'package:alquran/data/models/juz_model.dart';
import 'package:alquran/data/models/juz_response.dart';
import 'package:alquran/data/models/surah_detail_model.dart';
import 'package:alquran/data/models/surah_detail_response.dart';
import 'package:alquran/data/models/surah_model.dart';
import 'package:alquran/data/models/surah_response.dart';

abstract class AlquranRemoteDataSource {
  Future<List<SurahModel>> getSurah();
  Future<SurahDetailModel> getSurahDetail(int id);
  Future<JuzDetailModel> getJuzDetail(int id);
}

class AlquranRemoteDataSourceImpl implements AlquranRemoteDataSource {
  static const String BASE_URL_QURAN = 'https://my-api-quran.vercel.app';
  final Dio dio;

  AlquranRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SurahModel>> getSurah() async {
    final response = await dio.get(
      '$BASE_URL_QURAN/surah',
    );

    if (response.statusCode == 200) {
      return SurahResponse.fromJson(response.data).surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SurahDetailModel> getSurahDetail(int id) async {
    final response = await dio.get('$BASE_URL_QURAN/surah/$id');

    if (response.statusCode == 200) {
      return SurahDetailResponse.fromJson(response.data).surahDetailModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<JuzDetailModel> getJuzDetail(int id) async {
    final response = await dio.get('$BASE_URL_QURAN/juz/$id');

    if (response.statusCode == 200) {
      return JuzDetailResponse.fromJson(response.data).juzDetailModel;
    } else {
      throw ServerException();
    }
  }
}
