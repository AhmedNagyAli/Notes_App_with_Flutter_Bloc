// ignore_for_file: unused_import, unused_local_variable, depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/database/models/notes.dart';
import 'package:todoapp/notes/repo/notes_pero.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NoteInitial()) {
    on<NotesEvent>((event, emit) {});

    NotesRepo repo = NotesRepo();

    on<NoteCreate>((event, emit) async {
      print(state);
      emit(NoteCreating());
      if (await repo.createNote(event.note)) {
        emit(NoteCreated());
      } else {
        emit(NoteFault());
      }
    });
    on<NoteRetrieve>((event, emit) async {
      emit(NoteRetrieving());
      List<Note> notes = await repo.getNotes();
      emit(NoteRetrieved(notes));
    });

    on<NoteUpdate>((event, emit) async {
      emit(NoteUpdating());
      if (await repo.updateNote(event.id, event.newNote)) {
        emit(NoteUpdated());
      } else {
        emit(NoteFault());
      }
    });
    on<NoteSearch>((event, emit) async {
      emit(NoteSearching());
      List<Note> notes = await repo.searchNote(event.query);
      emit(NoteRetrieved(notes));
    });
  }
}
