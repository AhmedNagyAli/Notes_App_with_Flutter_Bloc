part of 'notes_bloc.dart';

abstract class NotesEvent {}

class NoteRetrieve extends NotesEvent {}

class NoteCreate extends NotesEvent {
  NoteCreate(this.note);
  Note note;
}

class NoteUpdate extends NotesEvent {
  NoteUpdate({required this.id, required this.newNote});
  int id;
  Note newNote;
}

class NoteSearch extends NotesEvent {
  NoteSearch({required this.query});
  String query;
}
