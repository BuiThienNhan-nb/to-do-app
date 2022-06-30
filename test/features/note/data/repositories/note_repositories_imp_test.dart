import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/core/error/failures.dart';
import 'package:to_do_app/core/platform/network_status.dart';
import 'package:to_do_app/features/note/data/datasources/note_remote_data_source.dart';
import 'package:to_do_app/features/note/data/repositories/note_repository_imp.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';

class MockNoteRemoteDataSource extends Mock implements NoteRemoteDataSource {}

class MockNetworkStatus extends Mock implements NetworkStatus {}

void main() {
  late MockNoteRemoteDataSource mockNoteRemoteDataSource;
  late MockNetworkStatus mockNetworkStatus;

  const String userId = '62b47ecb9ed00df6b52215ec';
  late List<Note> tNotes;
  late NoteRepositoryImp repositoryImp;

  setUp(() {
    mockNoteRemoteDataSource = MockNoteRemoteDataSource();
    mockNetworkStatus = MockNetworkStatus();
    repositoryImp = NoteRepositoryImp(
      noteRemoteDataSource: mockNoteRemoteDataSource,
      networkStatus: mockNetworkStatus,
    );

    final Note tNote = Note(
      id: '1',
      userId: userId,
      title: 'title',
      description: 'description',
      priority: 'Must Do',
      deadline: null,
      hasDone: false,
    );
    tNotes = [tNote, tNote, tNote, tNote];
  });

  group('when user is online', () {
    setUp(() {
      when(() => mockNetworkStatus.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return all notes data when call to remote data source is successful',
        () async {
      // arrange
      when(() => mockNoteRemoteDataSource.getAllNotes())
          .thenAnswer((_) async => tNotes);
      // act
      final result = await repositoryImp.getAllNotes();
      // assert
      verify(() => mockNoteRemoteDataSource.getAllNotes()).called(1);
      expect(result, equals(Right(tNotes)));
    });

    test(
        'should return users notes data when call to remote data source is successful',
        () async {
      // arrange
      when(() => mockNoteRemoteDataSource.getNotesByUserId(userId))
          .thenAnswer((_) async => tNotes);
      // act
      final result = await repositoryImp.getNotesByUserId(userId);
      // assert
      verify(() => mockNoteRemoteDataSource.getNotesByUserId(userId)).called(1);
      expect(result, equals(Right(tNotes)));
    });
  });

  group('when user is offline', () {
    setUp(() {
      when(() => mockNetworkStatus.isConnected).thenAnswer((_) async => false);
    });

    test('return failure exception when call to remote data source is failure',
        () async {
      // arrange
      when(() => mockNoteRemoteDataSource.getNotesByUserId(userId))
          .thenAnswer((_) async => tNotes);
      // act
      final result = await repositoryImp.getNotesByUserId(userId);
      // assert
      verifyNever(() => mockNoteRemoteDataSource.getNotesByUserId(userId));
      // verify(() => mockNoteRemoteDataSource.getNotesByUserId(userId)).called(0);
      expect(result, equals(Left(UserFailure())));
    });
  });
}
