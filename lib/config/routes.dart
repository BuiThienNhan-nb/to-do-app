import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/features/note/presentation/pages/note_page.dart';
import 'package:to_do_app/utils/test/bloc/bloc/counter_bloc.dart';
import 'package:to_do_app/utils/test/page/counter_test_page.dart';

import '../features/note/presentation/bloc/bloc/note_bloc.dart';

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  // Route name
  static const String note = "/note";
  static const String test = "/test";

  // initial Route
  static String get init => note;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final getIt = GetIt.instance;
    switch (settings.name) {
      case AppRoutes.note:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NoteBloc>()
              ..add(const GetNoteByUserID(userId: "62b29670a4448f451c4ec3d7")),
            child: const NotePage(),
          ),
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
