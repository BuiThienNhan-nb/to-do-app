import 'package:dio/dio.dart';

import '../config/domain.dart';

class TestServer {
  static final TestServer _singleton = TestServer._internal();

  factory TestServer() => _singleton;

  TestServer._internal();

  final String serverUrl = AppDomain.apiUrl;

  Future<Response> testServer() async {
    final Dio dio = Dio();
    Response response = await dio.get("$serverUrl/example");
    return response;
  }
}
