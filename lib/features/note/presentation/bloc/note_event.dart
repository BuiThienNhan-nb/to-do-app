part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();
}

class GetAllNote extends NoteEvent {
  @override
  List<Object?> get props => [];
}

class GetNoteByUserID extends NoteEvent {
  final String userId;

  const GetNoteByUserID({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AddNote extends NoteEvent {
  final Note note;

  const AddNote(this.note);

  @override
  List<Object?> get props => [note];
}

class UpdateNote extends NoteEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object?> get props => [note];
}

class DeleteNote extends NoteEvent {
  final String noteId;

  const DeleteNote(this.noteId);

  @override
  List<Object?> get props => [noteId];
}
