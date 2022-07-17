import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/home/presentation/pages/profile_page.dart';
import 'package:to_do_app/features/home/presentation/pages/sign_out_page.dart';

import '../features/auth/presentation/pages/sign_in_page.dart';
import '../features/auth/presentation/pages/sign_up_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/note/domain/entities/note.dart';
import '../features/note/presentation/pages/add_note_page.dart';
import '../features/note/presentation/pages/note_detail_page.dart';
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
  static const String signIn = "/auth/sign-in";
  static const String signUp = "/auth/sign-up";
  static const String signOut = "/auth/sign-out";
  static const String home = "/home";
  static const String note = "/note";
  static const String profile = "/profile";
  static const String noteDetail = "/note-detail";
  static const String addNote = "/add-note";
  static const String test = "/test";

  // initial Route
  static String get init => signIn;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signIn:
        return CupertinoPageRoute(
          // builder: (context) => BlocProvider(
          //   create: (context) =>
          //       GetIt.I<AuthBloc>()..state.status = BlocStatus.initial,
          //   child: const SignInPage(),
          // ),
          builder: (context) => const SignInPage(),
        );
      case AppRoutes.signUp:
        return CupertinoPageRoute(
          // builder: (context) => BlocProvider(
          //   create: (context) => GetIt.I<AuthBloc>(),
          //   child: const SignUpPage(),
          // ),
          builder: (context) => const SignUpPage(),
        );
      case AppRoutes.signOut:
        return CupertinoPageRoute(
          builder: (context) => const SignOutPage(),
        );
      case AppRoutes.profile:
        return CupertinoPageRoute(
          builder: (context) => const ProfilePage(),
        );

      case AppRoutes.home:
        return CupertinoPageRoute(
          // builder: (context) => BlocProvider(
          //   create: (context) => GetIt.I<NoteBloc>()
          //     ..add(
          //       GetNoteByUserID(userId: AppValue.currentUser.id),
          //     ),
          //   child: const HomePage(),
          // ),
          builder: (context) => const HomePage(),
        );
      case AppRoutes.note:
        return CupertinoPageRoute(
          // builder: (context) => BlocProvider(
          //   create: (context) => GetIt.I<NoteBloc>()
          //     ..add(
          //       GetNoteByUserID(userId: AppValue.currentUser.id),
          //     ),
          //   child: const NotePage(),
          // ),
          builder: (context) => const NotePage(),
        );
      case AppRoutes.test:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CounterBloc(),
            child: const CounterTestPage(),
          ),
        );
      case AppRoutes.noteDetail:
        final argument = settings.arguments as Note;
        return CupertinoPageRoute(
          builder: (_) => NoteDetailPage(note: argument),
        );
      case AppRoutes.addNote:
        return CupertinoPageRoute(
          // builder: (context) => BlocProvider(
          //   create: (context) => GetIt.I<NoteBloc>(),
          //   child: AddNotePage(),
          // ),
          builder: (context) => AddNotePage(),
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
