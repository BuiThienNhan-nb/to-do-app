import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/config/colors.dart';
import 'package:to_do_app/features/note/presentation/widget/w_note_floating_btn.dart';

import '../../../../core/app/value.dart';
import '../../../../core/bloc/status.dart';
import '../../../../core/error/w_error_refresh_button.dart';
import '../bloc/note_bloc.dart';
import '../widget/note_page_components.dart';
import '../widget/w_list_notes.dart';
import '../widget/w_note_home_background_container.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const NoteFloatingButton(),
      body: noteHomeBackgroundContainer(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            notePageTitle(
                "Hello, Thiện Nhân!\n", "Let's take a moment to check in"),
            SizedBox(height: 12.h),
            BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                if (state.status == BlocStatus.initial ||
                    state.status == BlocStatus.loading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                if (state.status == BlocStatus.loaded) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: ListNotesWidget(notes: state.notes),
                    ),
                  );
                }
                return Expanded(
                  child: ErrorRefreshButton(
                    message: state.errorMessage ?? "Unexpected error!",
                    callback: () {
                      BlocProvider.of<NoteBloc>(context).add(
                        GetNoteByUserID(userId: AppValue.currentUser.id),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
