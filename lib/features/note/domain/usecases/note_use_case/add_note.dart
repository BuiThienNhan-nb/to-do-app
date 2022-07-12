import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/note.dart';
import '../../repositories/note_repositories.dart';

class AddNoteUseCase implements UseCase<void, AddNoteParams> {
  final NoteRepository _repository;

  AddNoteUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(AddNoteParams p) async =>
      await _repository.addNote(p.note, p.userId);
}

class AddNoteParams extends Equatable {
  final Note note;
  final String userId;

  const AddNoteParams({required this.note, required this.userId});

  @override
  List<Object?> get props => [note, userId];
}
