import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/note.dart';
import '../../repositories/note_repositories.dart';

class AddNoteUseCase implements UseCase<Note, AddNoteParams> {
  final NoteRepository _repository;

  AddNoteUseCase(this._repository);

  @override
  Future<Either<Failure, Note>> call(AddNoteParams p) async =>
      await _repository.addNote(p.note);
}

class AddNoteParams extends Equatable {
  final Note note;

  const AddNoteParams({required this.note});

  @override
  List<Object?> get props => [note];
}
