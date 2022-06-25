import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/bloc/status.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';
import 'package:to_do_app/features/note/domain/repositories/note_repositories.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository repository;

  NoteBloc({required this.repository}) : super(NoteState.initial()) {
    on<GetAllNote>(_getAllNote);
    on<GetNoteByUserID>(_getNoteByUserID);
  }

  void _getAllNote(GetAllNote event, Emitter<NoteState> emit) {}

  void _getNoteByUserID(GetNoteByUserID event, Emitter<NoteState> emit) {}
}
