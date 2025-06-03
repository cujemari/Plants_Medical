import 'package:sqflite/sqflite.dart';

class FavoritePlantTable {
  static const String tablename = "favorite_plant";
  static Future<void> createTable(Database db) async {
    // Tabla de favoritos del usuario
    await db.execute('''
      CREATE TABLE $tablename (
        favoriteplant_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        plant_id INTEGER,
        title_favorite TEXT,
        is_favorite INTEGER DEFAULT 0,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        UNIQUE(user_id, plant_id),
        FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY (plant_id) REFERENCES plant(plant_id) ON DELETE CASCADE
      );
    ''');
  }
}
