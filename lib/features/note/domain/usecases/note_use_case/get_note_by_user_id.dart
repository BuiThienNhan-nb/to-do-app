// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/note.dart';
import '../../repositories/note_repositories.dart';

class GetNoteByUserIDUseCase implements UseCase<List<Note>, GetNoteParams> {
  final NoteRepository _repository;

  GetNoteByUserIDUseCase(this._repository);

  @override
  Future<Either<Failure, List<Note>>> call(GetNoteParams p) async =>
      await _repository.getNotesByUserId(p.userId);
}

class GetNoteParams extends Equatable {
  final String userId;

  const GetNoteParams({required this.userId}) : super();

  @override
  List<Object?> get props => [userId];
}
