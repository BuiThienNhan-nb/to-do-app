part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetAllNote extends NoteEvent {}

class GetNoteByUserID extends NoteEvent {
  final String userId;

  const GetNoteByUserID({required this.userId});

  @override
  List<Object> get props => [userId];
}
