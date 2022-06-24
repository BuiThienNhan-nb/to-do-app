import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error/failures.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';

import '../repositories/note_repositories.dart';

class GetAllNote {
  final NoteRepository _repository;

  GetAllNote(this._repository);

  Future<Either<Failure, List<Note>>> call() async =>
      await _repository.getAllNotes();
}
