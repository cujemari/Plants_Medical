import 'package:sqflite/sqflite.dart';

class UseTable {
  static const String tableName = "preparation_use";

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        preparationuse_id INTEGER PRIMARY KEY AUTOINCREMENT,
        plant_id INTEGER,
  
        use TEXT,
        preparation TEXT,
        indication TEXT,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (plant_id) REFERENCES plant(plant_id) ON DELETE CASCADE
      );
    ''');
  }
}
