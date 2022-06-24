import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getAllNotes();
}
