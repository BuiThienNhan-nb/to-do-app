import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/note/presentation/pages/note_page.dart';
import '../utils/test/bloc/bloc/counter_bloc.dart';
import '../utils/test/page/counter_test_page.dart';

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  // Route name
  static const String home = "/home";
  static const String note = "/note";
  static const String test = "/test";

  // initial Route
  static String get init => home;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
      case AppRoutes.note:
        return CupertinoPageRoute(
          builder: (_) => const NotePage(),
        );
      case AppRoutes.test:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CounterBloc(),
            child: const CounterTestPage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return CupertinoPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}
