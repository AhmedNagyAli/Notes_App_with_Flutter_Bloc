// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:todoapp/database/config.dart';
import 'package:todoapp/database/models/notes.dart';

class NotesRepo {
  Future<bool> createNote(Note note) async {
    if (note.isEmpty) return false;
    Database connection = await DBConfig.getConnection();
    int result = await connection.insert('notes', note.toMap()).then((value) {
      print('insert success');
      return 1;
    }).onError((error, stackTrace) {
      print(stackTrace);
      return 0;
    });

    return result == 0 ? false : true;
  }

  Future<List<Note>> getNotes() async {
    Database connection = await DBConfig.getConnection();
    List<Map<String, Object?>> notesQueryResult =
        await connection.query('notes', limit: 200);
    List<Note> notes = [];
    for (var element in notesQueryResult) {
      notes.add(Note.fromMap(element));
    }

    return notes;
  }

  Future<bool> updateNote(int id, Note newNote) async {
    Database connection = await DBConfig.getConnection();
    await connection.update('notes', newNote.toMap(),
        where: 'id = ?', whereArgs: [id]).then((value) {
      print('update success');
      return 1;
    });
    return true;
  }

  Future<List<Note>> searchNote(String query) async {
    Database connection = await DBConfig.getConnection();
    List<Map<String, Object?>> notesQueryResult = await connection
        .query('notes', where: '(txt LIKE ?)', whereArgs: ['%$query%']);

    List<Note> notes = notesQueryResult.map((e) => Note.fromMap(e)).toList();

    return notes;
  }
}
