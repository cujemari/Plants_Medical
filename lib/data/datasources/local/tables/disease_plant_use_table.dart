import 'package:sqflite/sqflite.dart';

class DiseasePlantUseTable {
  static const String tableName = "disease_plant_use";

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        diseplant_id INTEGER PRIMARY KEY AUTOINCREMENT,
        disease_id INTEGER,
        plant_id INTEGER,
        use TEXT,
        preparation TEXT,
        indication TEXT,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (plant_id) REFERENCES plant(plant_id) ON DELETE CASCADE,
        FOREIGN KEY (disease_id) REFERENCES disease(disease_id) ON DELETE CASCADE
      );
    ''');
  }
}
