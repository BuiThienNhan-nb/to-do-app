// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';

import '../../../../core/error/failures.dart';
import '../entities/note.dart';
import '../repositories/note_repositories.dart';

class GetNoteByUserID implements UseCase<List<Note>, Params> {
  final NoteRepository _repository;

  GetNoteByUserID(this._repository);

  @override
  Future<Either<Failure, List<Note>>> call(Params p) async =>
      await _repository.getNotesByUserId(p.userId);
}

class Params extends Equatable {
  final String userId;

  const Params({required this.userId}) : super();

  @override
  List<Object?> get props => [userId];
}
