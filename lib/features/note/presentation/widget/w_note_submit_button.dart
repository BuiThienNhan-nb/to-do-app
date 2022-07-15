import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/dimens.dart';

class NoteSubmitButton extends StatelessWidget {
  double height = 60.h;
  double width = double.infinity;
  final Function() submit;

  NoteSubmitButton(
      {Key? key,
      required this.submit,
      this.height = 60,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: submit,
        child: const Text("Submit"),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.endeavourColor),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.whiteColor),
          overlayColor: MaterialStateProperty.all<Color>(AppColors.shipCove),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.itemRadius),
            ),
          ),
        ),
      ),
    );
  }
}
