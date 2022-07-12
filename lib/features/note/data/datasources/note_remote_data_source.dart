import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:to_do_app/config/end_point/note_end_point.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/note.dart';

abstract class NoteRemoteDataSource {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getNotesByUserId(String userId);
  Future<void> addNote(Note note, String userId);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String noteId);
}

class NoteRemoteDataSourceImp implements NoteRemoteDataSource {
  final Dio dio;
  final String? accessToken;
  NoteRemoteDataSourceImp({required this.dio, this.accessToken});

  final String serverUrl = dotenv.env['SERVER_API_URL'] ?? '';

  @override
  Future<void> addNote(Note note, String userId) async {
    if (serverUrl.isEmpty) throw ServerException('server url is required');

    dio.options.headers['Authorization'] = 'JWT $accessToken';
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
        if (value.data['success'] == 'false') {
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
    if (serverUrl.isEmpty) throw ServerException('server url is required');

    dio.options.headers['Authorization'] = 'JWT $accessToken';
    final Response response =
        await dio.get(serverUrl + NoteEndPoints.getNotesByUserId(userId)).then(
      (value) {
        if (value.data['success'] == 'false') {
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
    if (serverUrl.isEmpty) throw ServerException('server url is required');

    dio.options.headers['Authorization'] = 'JWT $accessToken';
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
        if (value.data['success'] == 'false') {
          throw ServerException(value.data['message']);
        }
      },
    );
  }

  @override
  Future<void> deleteNote(String noteId) async {
    if (serverUrl.isEmpty) throw ServerException('server url is required');
    dio.options.headers['Authorization'] = 'JWT $accessToken';
    await dio.delete(serverUrl + NoteEndPoints.deleteNote(noteId)).then(
      (value) {
        if (value.data['success'] == 'false') {
          throw ServerException(value.data['message']);
        }
      },
    );
  }
}
