import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/note.dart';
import '../repositories/note_repositories.dart';

class AddNote {
  final NoteRepository _repository;
  final Note _note;

  AddNote(this._note, this._repository);

  Future<Either<Failure, List<Note>>> call() async =>
      await _repository.addNote(_note);
}
