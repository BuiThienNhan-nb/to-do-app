import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/dimens.dart';
import '../../../../config/formats.dart';
import '../../../../config/styles.dart';
import '../../../../core/bloc/status.dart';
import '../../../../core/error/w_error_refresh_button.dart';
import '../../domain/entities/note.dart';
import '../bloc/note_bloc.dart';
import '../widget/w_note_check_box.dart';
import '../widget/w_note_drop_down.dart';
import '../widget/w_note_home_background_container.dart';
import '../widget/w_note_submit_button.dart';
import '../widget/w_note_text_form_field.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;

  const NoteDetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    final TextEditingController txtTitleController =
        TextEditingController(text: note.title);
    final TextEditingController txtDescriptionController =
        TextEditingController(text: note.description);
    final TextEditingController txtDeadlineController = TextEditingController(
      text: AppFormat.formatDay.format(
        note.deadline ?? DateTime.now(),
      ),
    );

    void pickDate() async {
      final initDate = AppFormat.formatDay.parse(txtDeadlineController.text);
      final pickDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now().add(const Duration(days: 366)),
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.itemRadius),
            ),
            child: child!,
          );
        },
      );
      if (pickDate == null) return;
      note.deadline = pickDate;
      txtDeadlineController.text = AppFormat.formatDay.format(pickDate);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.blackColor,
        elevation: 0.h,
      ),
      body: SingleChildScrollView(
        child: noteHomeBackgroundContainer(
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 120.h),
                Image.asset("assets/icons/note_detail_page_icon.png"),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        note.title,
                        style: AppStyles.headline4TextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    NoteCheckBox(
                      isCheck: note.hasDone,
                      callback: (bool callbackValue) =>
                          note.hasDone = callbackValue,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                NoteTextFormField(
                  controller: txtTitleController,
                  label: "Title",
                  callback: (String callbackValue) {
                    note.title = callbackValue;
                  },
                ),
                SizedBox(height: 20.h),
                NoteTextFormField(
                  controller: txtDescriptionController,
                  label: "Description",
                  callback: (String callbackValue) {
                    note.description = callbackValue;
                  },
                ),
                SizedBox(height: 20.h),
                NoteDropDownButton(
                  label: "Priority",
                  selectedValue: note.priority,
                  callback: (String callbackValue) {
                    note.priority = callbackValue;
                  },
                ),
                SizedBox(height: 20.h),
                NoteTextFormField(
                  controller: txtDeadlineController,
                  label: "Deadline",
                  onTap: pickDate,
                  readOnly: true,
                  callback: (value) {},
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: BlocBuilder<NoteBloc, NoteState>(
                    builder: (context, state) {
                      if (state.status == BlocStatus.initial ||
                          state.status == BlocStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state.status == BlocStatus.loaded) {
                        return NoteSubmitButton(
                          submit: () {
                            BlocProvider.of<NoteBloc>(context).add(
                              UpdateNote(note),
                            );
                          },
                        );
                      }
                      return ErrorRefreshButton(
                        message: state.errorMessage ?? "Unexpected error!",
                        callback: () {
                          BlocProvider.of<NoteBloc>(context).add(
                            UpdateNote(note),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
