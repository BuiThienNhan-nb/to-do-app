import 'package:flutter/material.dart';
import 'package:to_do_app/features/note/presentation/widget/w_note_home_background_container.dart';

import '../../domain/entities/note.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;

  const NoteDetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: noteHomeBackgroundContainer(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [],
        ),
      ),
    );
  }
}
