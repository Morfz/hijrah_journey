import 'package:addon/data/models/doa_model.dart';
import 'package:core/core.dart';
import 'package:http/http.dart' as http;

abstract class DoaRemoteDataSource {
  Future<List<DoaModel>> getDoa();
}

class DoaRemoteDataSourceImpl implements DoaRemoteDataSource {
  static const BASE_URL_DOA = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  final http.Client client;

  DoaRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DoaModel>> getDoa() async {
    final response = await client.get(Uri.parse(BASE_URL_DOA));

    if (response.statusCode == 200) {
      return doaModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
