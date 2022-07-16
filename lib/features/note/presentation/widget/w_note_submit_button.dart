import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/dimens.dart';

class NoteActionButton extends StatelessWidget {
  double height = 60.h;
  double width = double.infinity;
  String title = "Submit";
  Color backgroundColor = AppColors.endeavourColor;
  final Function() submit;

  NoteActionButton({
    Key? key,
    required this.submit,
    this.title = "Submit",
    this.backgroundColor = AppColors.endeavourColor,
    this.height = 60,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: submit,
        child: Text(title),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          primary: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          ),
          shadowColor: AppColors.blackColor,
          elevation: 4.w,
        ),
      ),
    );
  }
}
