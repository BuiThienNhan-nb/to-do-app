import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/routes.dart';

class NoteFloatingButton extends StatelessWidget {
  const NoteFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.w),
      decoration: BoxDecoration(
        color: AppColors.endeavourColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shipCove,
            blurRadius: 8.w,
            offset: Offset(1.w, 3.w),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context, rootNavigator: true)
            .pushNamed(AppRoutes.addNote),
        icon: const Icon(Icons.add),
        color: AppColors.whiteColor,
      ),
    );
  }
}
