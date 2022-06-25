part of 'note_bloc.dart';

class NoteState extends Equatable {
  BlocStatus status;
  List<Note> notes;

  NoteState._({
    this.status = BlocStatus.initial,
    this.notes = const <Note>[],
  });

  NoteState.initial() : this._();

  NoteState.loading() : this._(status: BlocStatus.loading);

  NoteState.loaded(List<Note> notes)
      : this._(
          status: BlocStatus.loaded,
          notes: notes,
        );

  NoteState.error() : this._(status: BlocStatus.error);

  @override
  List<Object> get props => [status, notes];
}
