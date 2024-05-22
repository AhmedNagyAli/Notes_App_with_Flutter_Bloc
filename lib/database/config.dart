// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoapp/database/tables/notes.dart';

class DBConfig {
  static Database? _database;

  static Future<Database> getConnection() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initialize();
      return _database!;
    }
  }

  static Future<String> getDBPath() async {
    const name = 'system.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  static _initialize() async {
    final path = await getDBPath();
    final db = await openDatabase(
      path,
      version: 1,
      singleInstance: true,
      onCreate: (db, version) {
        bool seed = true;
        NoteDB.onCreate(db, seed);
      },
    );
    return db;
  }

  static Future<Database> initDB() async {
    _database = await _initialize();
    return _database!;
  }

  static deleteDB() async {
    await deleteDatabase(await getDBPath());
  }
}
