import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/note_repositories.dart';

class DeleteNoteUseCase implements UseCase<void, DeleteNoteParams> {
  final NoteRepository _repository;

  DeleteNoteUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(DeleteNoteParams p) async =>
      await _repository.deleteNote(p.noteId);
}

class DeleteNoteParams extends Equatable {
  final String noteId;

  const DeleteNoteParams(this.noteId);

  @override
  List<Object?> get props => [noteId];
}
