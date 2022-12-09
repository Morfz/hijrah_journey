import 'dart:convert';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
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
  final http.Client client;

  HadistRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RawiModel>> getRawi() async {
    final response = await client.get(Uri.parse('$BASE_URL_HADIST/books'));

    if (response.statusCode == 200) {
      return RawiResponse.fromJson(json.decode(response.body)).surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ListHadistModel> getListHadist(String id) async {
    final response = await client.get(Uri.parse('$BASE_URL_HADIST/books/$id?range=1-100'));

    if (response.statusCode == 200) {
      return ListHadistResponse.fromJson(json.decode(response.body)).surahDetailModel;
    } else {
      throw ServerException();
    }
  }
}
