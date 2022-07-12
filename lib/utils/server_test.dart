import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TestServer {
  static final TestServer _singleton = TestServer._internal();

  factory TestServer() => _singleton;

  TestServer._internal();

  final String serverUrl = dotenv.get('SERVER_API_URL');

  Future<Response> testServer() async {
    final Dio dio = Dio();
    Response response = await dio.get("$serverUrl/example");
    return response;
  }
}
