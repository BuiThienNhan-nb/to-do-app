import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/platform/network_status.dart';
import 'package:to_do_app/features/note/data/datasources/note_remote_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repositories.dart';

class NoteRepositoryImp implements NoteRepository {
  final NoteRemoteDataSource noteRemoteDataSource;
  final NetworkStatus networkStatus;

  NoteRepositoryImp({
    required this.noteRemoteDataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, List<Note>>> addNote(Note note) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    return Right(await noteRemoteDataSource.addNote(note));
  }

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    return Right(await noteRemoteDataSource.getAllNotes());
  }

  @override
  Future<Either<Failure, List<Note>>> getNotesByUserId(String userId) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    return Right(await noteRemoteDataSource.getNotesByUserId(userId));
  }
}
