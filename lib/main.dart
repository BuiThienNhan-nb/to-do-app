import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/app/value.dart';
import 'package:to_do_app/utils/dependency_init.dart';
import 'package:to_do_app/utils/server_test.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initServices();
  await _testServer();
  await _initDependency();

  runApp(const ToDoApp());
}

Future<void> _testServer() async {
  await TestServer().testServer().then((value) {
    log('get response from server successful');
  });
}

Future<void> _initServices() async {
  await dotenv.load(fileName: ".env");
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  AppValue.accessToken = preferences.getString('token') ?? "";
  log(AppValue.accessToken);
}

Future<void> _initDependency() async {
  await DependencyInitializer.init();
}
