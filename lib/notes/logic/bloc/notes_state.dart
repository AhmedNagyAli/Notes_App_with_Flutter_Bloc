part of 'notes_bloc.dart';

abstract class NotesState {}

class NoteInitial extends NotesState {}

class NoteFault extends NotesState {}

class NoteCreating extends NotesState {}

class NoteCreated extends NotesState {}

class NoteRetrieving extends NotesState {}

class NoteRetrieved extends NotesState {
  NoteRetrieved(this.notes);
  List<Note> notes;
}

class NoteUpdating extends NotesState {}

class NoteUpdated extends NotesState {}

class NoteSearching extends NotesState {}
