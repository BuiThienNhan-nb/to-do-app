import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/utils/server_test.dart';

import 'app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TestServer().testServer().then((value) {
    print(value);
    log('get response from server successful');
  });

  runApp(const ToDoApp());
}
