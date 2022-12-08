import 'package:addon/data/models/doa_model.dart';
import 'package:core/core.dart';
import 'package:http/http.dart' as http;

abstract class DoaRemoteDataSource {
  Future<List<DoaModel>> getDoaList();
}

class RemoteDataSourceImpl implements DoaRemoteDataSource {
  static const baseURL = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<DoaModel>> getDoaList() async {
    final response = await client.get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      return doaModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
