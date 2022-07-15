import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';

class NoteCheckBox extends StatefulWidget {
  bool isCheck;
  final Function(bool callbackValue) callback;

  NoteCheckBox({
    Key? key,
    required this.isCheck,
    required this.callback,
  }) : super(key: key);

  @override
  State<NoteCheckBox> createState() => _NoteCheckBoxState();
}

class _NoteCheckBoxState extends State<NoteCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4.h,
      child: Checkbox(
        value: widget.isCheck,
        onChanged: (value) {
          widget.callback(value ?? false);
          setState(() => widget.isCheck = value ?? false);
        },
        shape: const CircleBorder(),
        activeColor: AppColors.endeavourColor,
        side: BorderSide(
          color: AppColors.blackColor,
          width: 2.w,
        ),
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: MaterialStateProperty.all(AppColors.endeavourColor),
        checkColor: AppColors.whiteColor,
      ),
    );
  }
}
