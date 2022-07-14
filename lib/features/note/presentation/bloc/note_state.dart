part of 'note_bloc.dart';

class NoteState extends Equatable {
  BlocStatus status;
  List<Note> notes;
  String? errorMessage;

  NoteState._({
    this.status = BlocStatus.initial,
    this.notes = const <Note>[],
    this.errorMessage,
  });

  NoteState.initial() : this._(status: BlocStatus.initial);

  NoteState.loading() : this._(status: BlocStatus.loading);

  NoteState.loaded(List<Note> notes)
      : this._(
          status: BlocStatus.loaded,
          notes: notes,
        );

  NoteState.error(String message)
      : this._(
          status: BlocStatus.error,
          errorMessage: message,
        );

  @override
  List<Object> get props => [status, notes];
}
