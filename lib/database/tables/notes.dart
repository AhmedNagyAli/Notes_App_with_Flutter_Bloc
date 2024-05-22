import 'package:sqflite/sqflite.dart';

class NoteDB {
  static const tableName = 'notes';
  static Future<void> onCreate(Database connection, bool seed) async {
    await connection.execute("""
                        CREATE TABLE IF NOT EXISTS "$tableName" (
                          "id"	INTEGER NOT NULL,
                          "txt"	TEXT NOT NULL,
                          PRIMARY KEY("id" AUTOINCREMENT)
                        );
                        """);
    if (seed) {
      connection.rawInsert("""INSERT INTO $tableName (txt)
VALUES ('احمد عبدالحميد'),
    ('احمد');""");
    }
  }
}
