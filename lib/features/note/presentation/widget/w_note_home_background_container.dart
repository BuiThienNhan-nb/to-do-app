import 'package:flutter/material.dart';

Container noteHomeBackgroundContainer(Widget child) => Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
