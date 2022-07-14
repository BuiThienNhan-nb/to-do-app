import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/status.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/note_use_case.dart';
import '../../domain/usecases/note_use_case/add_note.dart';
import '../../domain/usecases/note_use_case/delete_note.dart';
import '../../domain/usecases/note_use_case/get_note_by_user_id.dart';
import '../../domain/usecases/note_use_case/update_note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteUseCase noteUseCase;

  NoteBloc(this.noteUseCase) : super(NoteState.initial()) {
    on<GetAllNote>(_getAllNote);
    on<GetNoteByUserID>(_getNoteByUserID);
    on<AddNote>(_addNote);
    on<UpdateNote>(_updateNote);
    on<DeleteNote>(_deleteNote);
  }

  void _getAllNote(GetAllNote event, Emitter<NoteState> emit) {}

  FutureOr<void> _getNoteByUserID(
      GetNoteByUserID event, Emitter<NoteState> emit) async {
    emit(NoteState.loading());
    final notesOrFailure = await noteUseCase
        .getNoteByUserIdUseCase(GetNoteParams(userId: event.userId));
    notesOrFailure.fold(
      (failure) => emit(NoteState.error(
          failure is ServerFailure ? failure.message : 'Unexpected Error')),
      (notes) {
        log(notes.toString());
        emit(NoteState.loaded(notes));
      },
    );
  }

  FutureOr<void> _addNote(AddNote event, Emitter<NoteState> emit) async* {
    emit(NoteState.loading());
    final addOrFailure = await noteUseCase
        .addNoteUseCase(AddNoteParams(note: event.note, userId: event.userId));
    addOrFailure.fold(
      (failure) => emit(NoteState.error(
          failure is ServerFailure ? 'Server Failure' : 'Unexpected Error')),
      (_) => emit(
        NoteState.loaded(List.from(state.notes)..add(event.note)),
      ),
    );
  }

  FutureOr<void> _updateNote(UpdateNote event, Emitter<NoteState> emit) async* {
    emit(NoteState.loading());
    final updateOrFailure =
        await noteUseCase.updateNoteUseCase(UpdateNoteParams(event.note));
    updateOrFailure.fold(
      (failure) => emit(NoteState.error(
          failure is ServerFailure ? 'Server Failure' : 'Unexpected Error')),
      (_) {
        state.notes[state.notes
            .indexWhere((note) => note.id == event.note.id)] = event.note;
        emit(NoteState.loaded(state.notes));
      },
    );
  }

  FutureOr<void> _deleteNote(DeleteNote event, Emitter<NoteState> emit) async* {
    emit(NoteState.loading());
    final updateOrFailure =
        await noteUseCase.deleteNoteUseCase(DeleteNoteParams(event.noteId));
    updateOrFailure.fold(
      (failure) => emit(NoteState.error(
          failure is ServerFailure ? 'Server Failure' : 'Unexpected Error')),
      (_) => emit(
        NoteState.loaded(List.from(state.notes)
          ..removeWhere((note) => note.id == event.noteId)),
      ),
    );
  }
}
