import 'package:dio/dio.dart';
import 'package:hadist/common/exception.dart';
import 'package:hadist/data/models/list_hadist_model.dart';
import 'package:hadist/data/models/list_hadist_response.dart';
import 'package:hadist/data/models/rawi_model.dart';
import 'package:hadist/data/models/rawi_response.dart';

abstract class HadistRemoteDataSource {
  Future<List<RawiModel>> getRawi();
  Future<ListHadistModel> getListHadist(String id);
}

class HadistRemoteDataSourceImpl implements HadistRemoteDataSource {
  static const String BASE_URL_HADIST = 'https://api.hadith.gading.dev';
  final Dio dio;

  HadistRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RawiModel>> getRawi() async {
    final response = await dio.get(
      '$BASE_URL_HADIST/books',
    );

    if (response.statusCode == 200) {
      return RawiResponse.fromJson(response.data).surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ListHadistModel> getListHadist(String id) async {
    final response = await dio.get('$BASE_URL_HADIST/books/$id?range=1-100');

    if (response.statusCode == 200) {
      return ListHadistResponse.fromJson(response.data).surahDetailModel;
    } else {
      throw ServerException();
    }
  }
}
