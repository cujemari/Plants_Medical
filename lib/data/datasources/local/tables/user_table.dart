import 'package:sqflite/sqflite.dart';

class UserTable {
  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE user (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        firebase_uid INTEGER UNIQUE,
        photo TEXT NOT NULL,
        full_name TEXT NOT NULL,
        email TEXT NOT NULL,
        title_user TEXT,
        description_user TEXT,
        is_offline INTEGER NOT NULL DEFAULT 0,
        sync_status TEXT NOT NULL DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000)
      );
    ''');
  }
}
