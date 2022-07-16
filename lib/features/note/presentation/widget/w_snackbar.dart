import 'package:flutter/material.dart';

import '../../../../config/colors.dart';

showSnackBar(BuildContext context, String title, String actionText) {
  SnackBar snackBar = SnackBar(
    duration: const Duration(milliseconds: 400),
    content: Text(title),
    action: SnackBarAction(
      label: actionText,
      textColor: AppColors.whiteColor,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
