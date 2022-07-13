import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/dimens.dart';
import 'config/routes.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppDimens.designSize,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRoutes().onGenerateRoute(settings),
        initialRoute: AppRoutes.init,
        // theme: ThemeDate,
      ),
    );
  }
}
