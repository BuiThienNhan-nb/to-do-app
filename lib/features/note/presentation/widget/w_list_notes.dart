import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/config/colors.dart';
import 'package:to_do_app/config/dimens.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';

class ListNotesWidget extends StatelessWidget {
  final List<Note> notes;

  const ListNotesWidget({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 20.h),
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notes.length,
        itemBuilder: (context, index) => noteItem(notes[index]),
      ),
    );
  }
}

GestureDetector noteItem(Note note) => GestureDetector(
      onTap: () {
        log("on Note Item ${note.id} tap");
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          height: 80.h,
          width: 324.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.itemRadius),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.eastBayColor,
                offset: Offset(4.sp, 3.sp),
                blurRadius: 2.r,
                blurStyle: BlurStyle.inner,
              )
            ],
            color: AppColors.boneColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 260.w,
                  child: Text(
                    note.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Image.asset("assets/icons/circle_arrow_next_icon.png"),
              ],
            ),
          ),
        ),
      ),
    );
