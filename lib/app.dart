import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/config/routes.dart';

import 'config/values.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppValue.designSize,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRoutes().onGenerateRoute(settings),
        initialRoute: AppRoutes.init,
        // theme: ThemeDate,
      ),
    );
  }
}
