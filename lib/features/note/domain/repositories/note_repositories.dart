import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getAllNotes();
  Future<Either<Failure, List<Note>>> getNotesByUserId(String userId);
  Future<Either<Failure, Note>> addNote(Note note);
  Future<Either<Failure, void>> updateNote(Note note);
  Future<Either<Failure, void>> deleteNote(String noteId);
}
