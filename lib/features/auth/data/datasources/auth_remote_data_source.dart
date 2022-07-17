import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/config/end_point/auth_end_point.dart';
import 'package:to_do_app/core/app/value.dart';
import 'package:to_do_app/features/auth/domain/entities/user.dart';

import '../../../../core/error/exceptions.dart';

const String SERVER_URL_EXCEPTION = "Server Url is required";

abstract class AuthRemoteDataSource {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String name, String email, String password);
  Future<void> signOut();
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final Dio dio = Dio();

  AuthRemoteDataSourceImp();

  final String serverUrl = dotenv.env['SERVER_API_URL'] ?? '';

  @override
  Future<User> signIn(String email, String password) async {
    if (serverUrl.isEmpty) throw ServerException(SERVER_URL_EXCEPTION);

    final Map<String, String> requestData = {
      "email": email,
      "password": password,
    };

    try {
      final Response response = await dio
          .post(serverUrl + AuthEndPoints.signIn, data: requestData)
          .then(
        (value) {
          if (value.data['success'] == false) {
            throw ServerException(value.data['message']);
          }
          return value;
        },
      );
      AppValue.accessToken = "";

      final result = response.data['user'];
      final User user = User.fromMap(result);

      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString('token', user.token);
      AppValue.accessToken = user.token;

      return user;
    } on Exception catch (e) {
      throw ServerException(e is ServerException ? e.message : e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    AppValue.currentUser = const User(
      id: "",
      name: "name",
      email: "email",
      token: "",
    );

    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString('token', "");
      AppValue.accessToken = "";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> signUp(String name, String email, String password) async {
    if (serverUrl.isEmpty) throw ServerException(SERVER_URL_EXCEPTION);

    final Map<String, String> requestData = {
      "name": name,
      "email": email,
      "password": password,
    };

    final Response response = await dio
        .post(serverUrl + AuthEndPoints.signUp, data: requestData)
        .then(
      (value) {
        if (value.data['success'] == false) {
          throw ServerException(value.data['message']);
        }
        return value;
      },
    );

    final result = response.data['user'];
    final User user = User.fromMap(result);

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', user.token);
    AppValue.accessToken = user.token;

    return user;
  }
}
