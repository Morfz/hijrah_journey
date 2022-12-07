import 'package:dio/dio.dart';

Dio dioClient() {
  final options = BaseOptions(
    connectTimeout: 120000,
    receiveTimeout: 120000,
    contentType: 'application/json',
  );

  var dio = Dio(options);
  // dio.interceptors.add(LogginInterceptors());
  // dio.interceptors.add(alice.getDioInterceptor());

  return dio;
}
