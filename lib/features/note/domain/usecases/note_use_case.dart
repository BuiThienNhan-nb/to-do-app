import 'package:to_do_app/features/note/domain/repositories/note_repositories.dart';

import 'note_use_case/add_note.dart';
import 'note_use_case/delete_note.dart';
import 'note_use_case/get_note_by_user_id.dart';
import 'note_use_case/update_note.dart';

class NoteUseCase {
  late GetNoteByUserIDUseCase getNoteByUserIdUseCase;
  late AddNoteUseCase addNoteUseCase;
  late UpdateNoteUseCase updateNoteUseCase;
  late DeleteNoteUseCase deleteNoteUseCase;
  final NoteRepository noteRepository;

  NoteUseCase(this.noteRepository) {
    getNoteByUserIdUseCase = GetNoteByUserIDUseCase(noteRepository);
    addNoteUseCase = AddNoteUseCase(noteRepository);
    updateNoteUseCase = UpdateNoteUseCase(noteRepository);
    deleteNoteUseCase = DeleteNoteUseCase(noteRepository);
  }
}
