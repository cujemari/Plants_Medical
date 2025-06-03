import 'package:sqflite/sqflite.dart';

class PlantViewHistoryTable {
  static Future<void> createTable(Database db) async {
    // Historial de plantas vistas
    await db.execute('''
      CREATE TABLE plant_view_history (
        plantviewhistory_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        plant_id INTEGER,
        fecha_vista INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY (plant_id) REFERENCES plant(plant_id) ON DELETE CASCADE
      );
    ''');
  }
}
