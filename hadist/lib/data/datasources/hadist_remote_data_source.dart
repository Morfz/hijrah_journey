import 'package:dio/dio.dart';
import 'package:hadist/common/constant.dart';
import 'package:hadist/common/exception.dart';
import 'package:hadist/data/models/list_hadist_model.dart';
import 'package:hadist/data/models/list_hadist_response.dart';
import 'package:hadist/data/models/rawi_model.dart';
import 'package:hadist/data/models/rawi_response.dart';

abstract class SurahRemoteDataSource {
  Future<List<SurahModel>> getRawi();
  Future<ListHadistModel> getListHadist(String id);
}

class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  final Dio dio;

  SurahRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SurahModel>> getRawi() async {
    final response = await dio.get(
      '$BASE_URL_HADIST/books',
    );

    if (response.statusCode == 200) {
      return SurahResponse.fromJson(response.data).surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ListHadistModel> getListHadist(String id) async {
    final response = await dio.get('$BASE_URL_HADIST/books/$id?range=1-300');

    if (response.statusCode == 200) {
      return SurahDetailResponse.fromJson(response.data).surahDetailModel;
    } else {
      throw ServerException();
    }
  }
}
