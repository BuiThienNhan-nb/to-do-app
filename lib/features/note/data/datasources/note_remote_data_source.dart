import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../config/end_point/note_end_point.dart';
import '../../../../core/app/value.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/note.dart';

abstract class NoteRemoteDataSource {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getNotesByUserId(String userId);
  Future<void> addNote(Note note, String userId);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String noteId);
}

const String SERVER_URL_EXCEPTION = "Server Url is required";

class NoteRemoteDataSourceImp implements NoteRemoteDataSource {
  final Dio dio = Dio();

  NoteRemoteDataSourceImp() {
    dio.options.headers['Authorization'] = 'JWT ${AppValue.accessToken}';
  }

  final String serverUrl = dotenv.env['SERVER_API_URL'] ?? '';

  @override
  Future<void> addNote(Note note, String userId) async {
    if (serverUrl.isEmpty) throw ServerException(SERVER_URL_EXCEPTION);

    final requestData = {
      "userId": userId,
      "title": note.title,
      "description": note.description,
      "priority": note.priority,
      "deadline": note.deadline,
      "hasDone": note.hasDone,
      "createdAt": note.createdAt,
    };
    await dio.post(serverUrl + NoteEndPoints.addNote, data: requestData).then(
      (value) {
        if (value.data['success'] == false) {
          throw ServerException(value.data['message']);
        }
      },
    );
  }

  @override
  Future<List<Note>> getAllNotes() async {
    return <Note>[];
  }

  @override
  Future<List<Note>> getNotesByUserId(String userId) async {
    if (serverUrl.isEmpty) throw ServerException(SERVER_URL_EXCEPTION);

    log(serverUrl + NoteEndPoints.getNotesByUserId(userId));
    final Response response =
        await dio.get(serverUrl + NoteEndPoints.getNotesByUserId(userId)).then(
      (value) {
        if (value.data['success'] == false) {
          throw ServerException(value.data['message']);
        }
        return value;
      },
    );
    final result = response.data['notes'] as List;

    return result.map((e) => Note.fromMap(e)).toList();
  }

  @override
  Future<void> updateNote(Note note) async {
    if (serverUrl.isEmpty) throw ServerException(SERVER_URL_EXCEPTION);

    final requestData = {
      "title": note.title,
      "description": note.description,
      "priority": note.priority,
      "deadline": note.deadline,
      "hasDone": note.hasDone,
      "createdAt": note.createdAt,
    };
    await dio
        .post(serverUrl + NoteEndPoints.updateNote(note.id), data: requestData)
        .then(
      (value) {
        if (value.data['success'] == false) {
          throw ServerException(value.data['message']);
        }
      },
    );
  }

  @override
  Future<void> deleteNote(String noteId) async {
    if (serverUrl.isEmpty) throw ServerException(SERVER_URL_EXCEPTION);

    await dio.delete(serverUrl + NoteEndPoints.deleteNote(noteId)).then(
      (value) {
        if (value.data['success'] == false) {
          throw ServerException(value.data['message']);
        }
      },
    );
  }
}
