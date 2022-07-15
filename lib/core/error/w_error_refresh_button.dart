import 'package:flutter/material.dart';
import 'package:to_do_app/config/colors.dart';

class ErrorRefreshButton extends StatelessWidget {
  final String message;
  Function()? callback;

  ErrorRefreshButton({
    Key? key,
    required this.message,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: callback ?? () {},
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.endeavourColor),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.aliceBlueColor),
          overlayColor: MaterialStateProperty.all<Color>(AppColors.shipCove),
        ),
        child: Text(
          "$message!\nClick to refresh page!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
