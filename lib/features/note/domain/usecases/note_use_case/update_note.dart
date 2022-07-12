import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/note.dart';
import '../../repositories/note_repositories.dart';

class UpdateNoteUseCase implements UseCase<void, UpdateNoteParams> {
  final NoteRepository _repository;

  UpdateNoteUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdateNoteParams p) async =>
      await _repository.updateNote(p.note);
}

class UpdateNoteParams extends Equatable {
  final Note note;

  const UpdateNoteParams(this.note);

  @override
  List<Object?> get props => [note];
}
