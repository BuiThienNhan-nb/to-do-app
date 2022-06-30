import 'package:to_do_app/features/note/domain/entities/note.dart';

abstract class NoteRemoteDataSource {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getNotesByUserId(String userId);
  Future<List<Note>> addNote(Note note);
}
