import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';
import 'package:to_do_app/features/note/domain/repositories/note_repositories.dart';
import 'package:to_do_app/features/note/domain/usecases/get_all_notes.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late MockNoteRepository mockNoteRepository;
  late GetAllNote useCase;
  late List<Note> tNotes;

  setUp(() {
    log('run setup');
    mockNoteRepository = MockNoteRepository();
    useCase = GetAllNote(mockNoteRepository);
    final Note tNote = Note(
      id: '1',
      title: 'title',
      description: 'description',
      deadline: null,
      hasDone: false,
    );
    tNotes = [tNote, tNote, tNote, tNote];
  });

  test(
    'should get all notes from the repository',
    () async {
      // arrange
      when(() => mockNoteRepository.getAllNotes())
          .thenAnswer((_) async => Right(tNotes));
      // act
      final result = await useCase.call();
      // assert
      expect(result, Right(tNotes));
      verify(() => mockNoteRepository.getAllNotes());
    },
  );
}
