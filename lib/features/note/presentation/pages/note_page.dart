import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: noteHomeBackgroundContainer(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            notePageTitle(
                "Hello, Thiện Nhân!\n", "Let's take a moment to check in"),
            BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                if (state.status == BlocStatus.initial ||
                    state.status == BlocStatus.loading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                if (state.status == BlocStatus.loaded) {
                  return SingleChildScrollView(
                    child: ListNotesWidget(notes: state.notes),
                  );
                }
                return ErrorRefreshButton(
                  message: state.errorMessage ?? "Unexpected error!",
                  callback: () {
                    BlocProvider.of<NoteBloc>(context).add(
                      GetNoteByUserID(userId: AppValue.currentUser.id),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      // Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/images/home_background.png"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       notePageTitle(
      //           "Hello, Thiện Nhân!\n", "Let's take a moment to check in"),
      //       BlocBuilder<NoteBloc, NoteState>(
      //         builder: (context, state) {
      //           if (state.status == BlocStatus.initial ||
      //               state.status == BlocStatus.loading) {
      //             return const Expanded(
      //                 child: Center(child: CircularProgressIndicator()));
      //           }
      //           if (state.status == BlocStatus.loaded) {
      //             return SingleChildScrollView(
      //               child: ListNotesWidget(notes: state.notes),
      //             );
      //           }
      //           // return Text('${state.errorMessage}');
      //           return ErrorRefreshButton(
      //             message: state.errorMessage ?? "Unexpected error!",
      //             callback: () {
      //               BlocProvider.of<NoteBloc>(context)
      //                   .add(GetNoteByUserID(userId: AppValue.currentUser.id));
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
