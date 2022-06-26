import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late Note tNote;

  setUp(() {
    tNote = Note(
      id: 'ObjectId',
      userId: 'userId',
      title: 'title',
      description: 'description',
      priority: 'Must Do',
      hasDone: false,
      deadline: DateTime.parse("2022-06-23T14:56:36.503+00:00"),
      createdAt: DateTime.parse("2022-06-23T14:56:36.503+00:00"),
    );
  });

  group('fromJson', () {
    test('should return a basic note', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('basic_note.json'));
      // act
      final result = Note.fromMap(jsonMap);
      // assert
      expect(result, tNote);
    });
  });

  group('toJson', () {
    test('should send basic note to json', () {
      // print(DateTime.parse("2022-06-23T14:56:36.503Z"));
      // print(DateTime.parse("2022-06-23T14:56:36.503+00:00"));

      // arrange
      final expectJson = {
        "id": "ObjectId",
        "userId": "userId",
        "title": "title",
        "description": "description",
        "priority": "Must Do",
        "hasDone": false,
        "deadline": "2022-06-23T14:56:36.503Z",
        "createdAt": "2022-06-23T14:56:36.503Z"
      };
      // act
      final result = tNote.toMap();
      // assert
      expect(result, expectJson);
    });
  });
}
