import 'package:sqflite/sqflite.dart';

class SettingTable {
  static Future<void> createTable(Database db) async {
    // Configuraciones del usuario
    await db.execute('''
      CREATE TABLE setting (
        setting_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        dark_mode INTEGER,
        terms_conditions TEXT,
        credits TEXT,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
      );
    ''');
  }
}
