import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final String title;

  const HomeAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
