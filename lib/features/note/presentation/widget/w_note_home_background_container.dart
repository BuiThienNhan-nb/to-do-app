import 'package:flutter/material.dart';
import 'package:to_do_app/config/dimens.dart';

Container noteHomeBackgroundContainer(Widget child) => Container(
      height: AppDimens.designSize.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
