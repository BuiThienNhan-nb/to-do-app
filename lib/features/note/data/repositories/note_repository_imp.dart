import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error/exceptions.dart';
import '../../../../core/platform/network_status.dart';
import '../datasources/note_remote_data_source.dart';

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
  Future<Either<Failure, void>> addNote(Note note, String userId) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await noteRemoteDataSource.addNote(note, userId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    return Right(await noteRemoteDataSource.getAllNotes());
  }

  @override
  Future<Either<Failure, List<Note>>> getNotesByUserId(String userId) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await noteRemoteDataSource.getNotesByUserId(userId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(Note note) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await noteRemoteDataSource.updateNote(note));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(String noteId) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await noteRemoteDataSource.deleteNote(noteId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
