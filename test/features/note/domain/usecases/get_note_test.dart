import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/core/usecases/usecase_core.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';
import 'package:to_do_app/features/note/domain/repositories/note_repositories.dart';
import 'package:to_do_app/features/note/domain/usecases/get_all_notes.dart';
import 'package:to_do_app/features/note/domain/usecases/get_note_by_user_id.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late MockNoteRepository mockNoteRepository;
  late GetAllNote getAllNoteUseCase;
  late GetNoteByUserID getNoteByUserIDUseCase;

  const String userId = '62b47ecb9ed00df6b52215ec';
  late List<Note> tNotes;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    getAllNoteUseCase = GetAllNote(mockNoteRepository);
    getNoteByUserIDUseCase = GetNoteByUserID(mockNoteRepository);
    final Note tNote = Note(
      id: '1',
      userId: userId,
      title: 'title',
      description: 'description',
      deadline: null,
      hasDone: false,
    );
    tNotes = [tNote, tNote, tNote, tNote];
  });

  group('Get Notes', () {
    test(
      'should get all notes from the repository',
      () async {
        // arrange
        when(() => mockNoteRepository.getAllNotes())
            .thenAnswer((_) async => Right(tNotes));
        // act
        final result = await getAllNoteUseCase(NoParams());
        // assert
        expect(result, Right(tNotes));
        verify(() => mockNoteRepository.getAllNotes());
      },
    );
    test('shuold get correct list notes from the current user', () async {
      // arrange
      when(() => mockNoteRepository.getNotesByUserId(userId))
          .thenAnswer((_) async => Right(tNotes));
      // act
      final result = await getNoteByUserIDUseCase(const Params(userId: userId));
      // assert
      expect(result, Right(tNotes));
      verify(() => mockNoteRepository.getNotesByUserId(userId));
    });
  });
}
