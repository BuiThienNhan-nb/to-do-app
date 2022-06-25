import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase_core.dart';
import '../entities/note.dart';
import '../repositories/note_repositories.dart';

class GetAllNote implements UseCase<List<Note>, NoParams> {
  final NoteRepository _repository;

  GetAllNote(this._repository);

  @override
  Future<Either<Failure, List<Note>>> call(NoParams params) async =>
      await _repository.getAllNotes();
}
