import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'config/dimens.dart';
import 'config/routes.dart';
import 'config/themes.dart';
import 'core/app/value.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/note/presentation/bloc/note_bloc.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppDimens.designSize,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.I<NoteBloc>()
              ..add(
                GetNoteByUserID(userId: AppValue.currentUser.id),
              ),
          ),
          BlocProvider(
            create: (context) => GetIt.I<AuthBloc>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRoutes().onGenerateRoute(settings),
          initialRoute: AppRoutes.init,
          theme: ThemeData(
            textTheme: AppThemes.appTextTheme,
            colorScheme: AppThemes.appColorSchema,
          ),
          // theme: ThemeDate,
        ),
      ),
    );
  }
}
